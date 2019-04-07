class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :set_card_items, only: [:index, :create]

  decorates_assigned :card
  decorates_assigned :cards

  def create
    @card = @card_items.create(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to deck_cards_url, notice: 'Card was successfully created.' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    @card.update_attributes!(card_params)
    respond_to do |format|
      format.js
      format.html { redirect_to deck_cards_url, notice: 'Card was successfully updated.' }
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to deck_cards_url, notice: 'Card was successfully destroyed.' }
      format.js
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
    params.require(:card).permit(:front, :back, :showed, :correct, :last_showed_at,
      :front_image, :word_class, :active)
  end
end
