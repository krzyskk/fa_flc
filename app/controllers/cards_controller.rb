class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @q = Card.ransack(params[:q])
    @cards = @q.result.decorate
    @card = Card.new
  end

  def show
    @card = Card.page(params[:page])
  end

  def create
    @card = Card.create(card_params).decorate
    @card.showed = 0
    @card.correct = 0
    @card.last_showed_at =  @card.created_at
    respond_to do |format|
      if @card.save
          format.html { redirect_to cards_url, notice: 'Card was successfully created.'  }
          format.js
      end
    end
  end

  def update

  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.js
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back, :showed, :correct, :last_showed_at)
  end
end
