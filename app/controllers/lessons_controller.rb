class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deck = Deck.find(params[:format])
    @lesson = @deck.lessons.create
    redirect_to @lesson
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def next_question
    @lesson = Lesson.last
    @lesson.answers.last.update(answer: params[:answer])
    @lesson.answers.create(card_id: @lesson.next_card_id)
  end
end
