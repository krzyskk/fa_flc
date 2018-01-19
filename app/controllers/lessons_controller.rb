class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deck = Deck.find(params[:format])
    @lesson = @deck.lessons.new
    @lesson.started_at = DateTime.now
    if @lesson.save
      4.times do
        create_answer(1)
      end
       cards_package = @deck.cards.where('correct_answers < 15').limit(10)
       cards_package.each do |card|
         @question = @lesson.questions.new
         @question.card_id = card.id
         @question.save
      end
      redirect_to @lesson
    else
      redirect_to root_path, notice: 'Error'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answer = @lesson.answers.last
  end

  def next_question
    @lesson = Lesson.last
    @last_answer = @lesson.answers.last
    @last_answer.answer = params[:answer]
    @last_answer.save!
    @last_card = Card.find(@last_answer.card_id)

    if @last_answer.answer == @last_card.back
      @lesson.increment!(:correct_answers)
      @last_card.increment!(:correct_answers)
      @last_answer.status = 'correct'
      srand
      number = rand(@lesson.questions.count)
      card = @lesson.questions[number].card_id
    else
      @lesson.increment!(:wrong_answers)
      @last_card.increment!(:wrong_answers)
      @last_answer.status = 'wrong'
      card =  @last_card.id
    end

    @last_answer.save!
    @answer = create_answer(card)

  end

  private

  def create_answer(card)
    answer = @lesson.answers.new
    answer.answer = " "
    answer.card_id = card
    answer.save!
    return answer
  end

end
