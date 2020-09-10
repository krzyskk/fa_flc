# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: %i[show edit update destroy import_cards]

  def index
    @decks = current_user.decks.all
    @number_of_memorized = @decks.joins(:cards)
                                 .where(cards: { memorized: true }).group(:deck_id).count
    @number_of_cards = @decks.joins(:cards).group(:deck_id).count
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    if @deck.save
      redirect_to decks_url, notice: "Deck #{@deck.name} was successfully created."
    else
      render :new
    end
  end

  def update
    CsvImporter.new.call(params[:file].path).each do |card|
      @deck.cards.find_or_create_by(card)
    end
    if @deck.update(deck_params)
      redirect_to decks_url, notice: "Deck #{@deck.name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_url, notice: "Deck #{@deck.name} was successfully destroyed."
  end

  def import_cards
   
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name, :description, :file)
  end
end
