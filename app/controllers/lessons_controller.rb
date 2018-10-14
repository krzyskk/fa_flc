class LessonsController < ApplicationController
  before_action :authenticate_user!

  decorates_assigned :cards

  def learn
    @deck = Deck.find(params[:deck_id])
    @lesson = @deck.lessons.find_or_create_by!(id: 1)
    4.times do
      @lesson.answers.create(card_id: @deck.cards.first.id)
    end
  end

  def next_question
    @lesson = Lesson.find(1)
    @lesson.answers.last.update(answer: params[:answer])
    @lesson.answers.create(card_id: @lesson.next_card_id)
  end
end
