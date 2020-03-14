class LessonsController < ApplicationController
  before_action :authenticate_user!

  def learn
    @lesson = lesson || deck.lessons.create!
    4.times do
      @lesson.answers.create!(card_id: deck.cards.first.id)
    end
    @lesson.save!
  end

  def next_question
    @lesson = lesson
    @lesson.answers.last.update(answer: params[:answer])
    @lesson.answers.create(card_id: @lesson.next_card_id)
  end

  private

  def deck
    Deck.find(params[:deck_id])
  end 

  def lesson
    deck.lessons.first
  end
end
