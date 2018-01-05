class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :import, :update, :destroy]
  before_action :set_card_items, only: [:index, :create]

  def index

  end

  def show
    @card = Card.page(params[:page])
  end

  def create
    @card = @card_items.create(card_params).decorate
    @card.last_showed_at =  @card.created_at
    respond_to do |format|
      if @card.save
          format.html { redirect_to '/', notice: 'Card was successfully created.'  }
          format.js
      end
    end
  end

  def edit
  end

  def update
    @card.update_attributes!(card_params)
    respond_to do |format|
      format.html { redirect_to deck_cards_url, notice: 'Card was successfully updated.' }
      format.js
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to deck_cards_url, notice: 'Card was successfully destroyed.' }
    end
  end

  def import
    @cards.import(params[:file])
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully imported.' }
    end
  end

  private

  def set_card_items
    @card_items = Deck.find(params[:deck_id]).cards
  end

  def set_card
    @card = Card.find(params[:id]).decorate
  end

  def card_params
    params.require(:card).permit(:front, :back, :showed, :correct, :last_showed_at, :front_image)
  end
end
