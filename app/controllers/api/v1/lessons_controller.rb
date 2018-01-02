module Api
  module V1
    class LessonsController < ::Api::V1::BaseController
      before_action :set_lesson, :set_question, only: [:next_question]

      def next_question
        @lesson.answers[-2].answer = params[:answer]
        if @lesson.answers[-2].answer == Card.find(@lesson.answers[-2].card_id).back
          @lesson.increment!(:correct_answers)
          @question.increment!(:correct_answers)
        end
        resp = {previous: Card.find(@lesson.answers[-2].card_id).front,
                your: @lesson.answers[-2].answer,
                correct: Card.find(@lesson.answers[-2].card_id).back,
                question: @question.front,
                number_of_questions: @lesson.showed_questions,
                number_of_correct: @lesson.correct_answers}
        render json: resp
      end

      private

      def set_question
        srand
        number = rand(@lesson.questions.count) + 1
        card = @lesson.questions.find(number).card_id
        @question = Card.find(card)
        @answer = @lesson.answers.new
        @answer.answer = ''
        @answer.card_id = @question.id
        @answer.save
        @lesson.increment!(:showed_questions)
        @question.increment!(:showed_questions)
      end

      def set_lesson
        @lesson = Lesson.find(1)
      end

    end
  end
end
