# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: %i[show edit update destroy import_cards learn next_question]
  skip_before_action :verify_authenticity_token, only: :next_question

  def index
    decks = current_user.decks.all
    @decks =  decks.order(created_at: :desc).page(params[:page]).per(4)
    @number_of_memorized = decks.joins(:cards)
                                 .where(cards: { status: 2 }).group(:deck_id).count
    @number_of_cards = decks.joins(:cards).group(:deck_id).count
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    if @deck.save
      redirect_to decks_url, notice: "Deck #{@deck.name} was successfully created."
    else
      redirect_to new_deck_path, alert: "Unable to create card"
    end
  end

  def update
    begin
      cards = CsvImporter.new.call(params[:deck][:file]&.path) || []
      cards.each do |card|
        @deck.cards.find_or_create_by(card)
      end
      if @deck.update(deck_params)
        redirect_to decks_url, notice: "Deck #{@deck.name} was successfully updated."
      else
        redirect_to edit_deck_path(@deck), alert: "Unable to update Deck #{@deck.name}"
      end
    rescue WrongColumnsError => e
      redirect_to edit_deck_path(@deck), alert: "Wrong file: #{e.message}"
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_url, notice: "Deck #{@deck.name} was successfully destroyed."
  end

  def learn
    @lesson = lesson || @deck.lessons.create!
    card_id = @deck.cards.first.id || @deck.cards.create!(front: 'sample', back: 'sample').id
    4.times do
      @lesson.answers.create!(card_id: card_id)
    end
    @lesson.save!
  end

  def next_question
    @lesson = lesson
    @lesson.answers.last.update(answer: params[:answer])
    @lesson.answers.create(card_id: @lesson.next_card_id)
    respond_to do |format|
      format.js
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name, :description)
  end

  def lesson
    @deck.lessons.first
  end
end
