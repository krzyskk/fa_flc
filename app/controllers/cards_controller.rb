# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = deck.cards.all
  end

  def new
    @card = deck.cards.new
  end

  def edit
  end

  def create
    @card = deck.cards.new(card_params)
      if @card.save
        redirect_to deck_cards_path(deck), notice: 'Card was successfully created.' 
      else
        render :new 
      end
  end

  def update
    if @card.update(card_params)
      redirect_to deck_cards_path(deck), notice: 'Card was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @card.destroy
    redirect_to deck_cards_path(deck), notice: 'Card was successfully destroyed.'
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
