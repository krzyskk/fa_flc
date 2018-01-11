class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deck = Deck.find(params[:format])
    @lesson = @deck.lessons.new
    @lesson.started_at = DateTime.now
    if @lesson.save
      answer = @lesson.answers.new
      answer.answer = " "
      answer.card_id = 1
      answer.save!
       cards_package = @deck.cards.where('correct_answers < 15').limit(10)
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
end
