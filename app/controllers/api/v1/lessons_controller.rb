module Api
  module V1
    class LessonsController < ::Api::V1::BaseController
      def next_question
        @lesson = Lesson.last
        @lesson.answers[0].answer = params[:answer]
        srand
        number = rand(@lesson.questions.count)
        card = @lesson.questions[number].card_id
        @question = Card.find(card)
        @answer = @lesson.answers.new
        @answer.answer = ''
        @answer.card_id = card
        @answer.save!

        if @lesson.answers[0].answer == Card.find(@lesson.answers[0].card_id).back
          @lesson.increment!(:correct_answers)
          @question.increment!(:correct_answers)
        else
          @lesson.increment!(:wrong_answers)
          @question.increment!(:wrong_answers)
        end

        resp = {previous: Card.find(@lesson.answers[0].card_id).front,
                your: @lesson.answers[0].answer,
                correct: Card.find(@lesson.answers[0].card_id).back,
                question: @question.front,
                number_of_questions: @lesson.number_of_answers,
                number_of_correct: @lesson.correct_answers,
                answers: @lesson.answers}
        render json: resp
      end
    end
  end
end
