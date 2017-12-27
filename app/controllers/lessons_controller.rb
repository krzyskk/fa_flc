class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :destroy]

  def new
    @lesson = Lesson.new
    @lesson.started_at = DateTime.now
    if @lesson.save
      cards_package = Card.where('correct < 9').limit(10)
      cards_package.each do |card|
        @question = @lesson.questions.new
        @question.card_id = card.id
        @question.save
      end
      redirect_to @lesson, notice: 'Lesson was successfully created.'
    else
      redirect_to root_path, notice: 'Error'
    end
  end

  def show
    #srand
    #number = rand(@lesson.questions.count)
    #card = @lesson.questions.find(number).card_id
    #@question = Card.find(card)
  end

  def question

  end

  def finish
    @lesson.destroy
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:started_at, :wrong_answers, :correct_answers)
  end

  def question_params
    params.permit(:question_id)
  end
end
