class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  decorates_assigned :card
  decorates_assigned :cards

  def index
    @decks = current_user.decks.all
  end

  def show
    @q = @deck.cards.ransack(params[:q])
    @cards = @q.result
    respond_to do |format|
      format.html { render 'cards/index' }
      format.csv { send_data @deck.cards.to_csv, filename: "#{@deck.name}_#{Date.today}.csv" }
    end
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    if @deck.save
      redirect_to @deck, notice: 'Deck was successfully created.'
    else
      render :new
    end
  end

  def update
    if @deck.update(deck_params)
      redirect_to decks_url, notice: 'Deck was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_url, notice: 'Deck was successfully destroyed.'
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:name, :description)
  end
end
