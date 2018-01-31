class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deck = Deck.find(params[:format])
    @lesson = @deck.lessons.new
    if @lesson.save
      4.times do
        create_answer(@deck.cards_package.first.id)
      end
       cards_package = @deck.cards_package
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

    if @last_answer.status == 'correct'
      increment_counters(:correct_answers)
      srand
      number = rand(@lesson.questions.count)
      card = @lesson.questions[number].card_id
    elsif @last_answer.status == 'empty'
      increment_counters(:empty_answers)
      card =  @last_answer.card_id
    else
      increment_counters(:wrong_answers)
      card =  @last_answer.card_id
    end

    @answer = create_answer(card)

  end

  private

  def create_answer(card)
    answer = @lesson.answers.new
    answer.card_id = card
    answer.save!
    return answer
  end

  def increment_counters(counter)
    @lesson.increment!(counter)
    Card.find(@last_answer.card_id).increment!(counter)
  end

end
