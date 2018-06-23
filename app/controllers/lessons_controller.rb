class LessonsController < ApplicationController
  before_action :authenticate_user!

  decorates_assigned :cards

  def new
    # begin
      @deck = Deck.find(params[:format])
      @lesson = @deck.lessons.create
      4.times do
        @lesson.answers.create(card_id: @deck.cards.first.id)
      end
      redirect_to @lesson
    # rescue
      # flash[:notice] = 'Unable to create lesson'
      # redirect_to root_path
    # end
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
