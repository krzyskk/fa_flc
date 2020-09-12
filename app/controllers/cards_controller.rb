# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = deck.cards.order(created_at: :desc).page(params[:page])
  end

  def new
    @card = deck.cards.new
  end

  def edit
  end

  def create
    @card = deck.cards.new(card_params)
    if @card.save
      redirect_to deck_cards_path(deck), notice: "Card #{@card.front} was successfully created."
    else
      redirect_to new_card_path, alert: "Unable to create card"
    end
  end

  def update
    if @card.update(card_params) && params[:redirected_from_lesson] == "true"
      redirect_to learn_deck_path(deck), notice: "Card #{@card.front} was successfully updated." 
    elsif @card.update(card_params) 
      redirect_to deck_cards_path(deck), notice: "Card #{@card.front} was successfully updated."   
    else
      redirect_back(fallback_location: deck_cards_path(deck), alert: "Unable to update card")
    end
  end

  def destroy
    @card.destroy
    redirect_to deck_cards_path(deck), notice: "Card #{@card.front} was successfully destroyed."
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def deck
    Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
