# frozen_string_literal: true

class DecksController < ApplicationController
  MININMAL_NUMBER_OF_QUESTIONS = Lesson::DISPLAY_ANSWERS + 2

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
    if @deck.cards.count < MININMAL_NUMBER_OF_QUESTIONS
      redirect_to deck_cards_path(@deck), alert: "Unable to start lesson with less than #{MININMAL_NUMBER_OF_QUESTIONS} cards"
    end
    if @deck.lessons.ongoing.present?
      @lesson = @deck.lessons.ongoing.last
    else
      @lesson = @deck.lessons.create!
      @deck.cards.last(20).pluck(:id).each do |card_id|
        @lesson.questions.create!(card_id: card_id)
      end
    end
  end

  def next_question
    @lesson = lesson
    @lesson.questions.last.update(last_answer: params[:answer])
    respond_to do |format|
      format.js
    end
  end

  private

  def ensure_minimal_number_of_cards 

  end

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
