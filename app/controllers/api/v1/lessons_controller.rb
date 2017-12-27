module Api
  module V1
    class LessonsController < ::Api::V1::BaseController
      before_action :set_lesson, only: [:next_question]

      def next_question
        resp = {previous: 'previous question',
                your: 'your answer',
                correct: 'correct answer',
                question: 'question',
                number_of_questions: '0',
                number_of_correct: '0'}
        #@lesson.answer = params[:json_data]
        answer = params[:json_data]
        @lesson.previous_question = @lesson.current_question
        render json: resp
      end

      private

      def set_lesson
        @lesson = Lesson.find(1)
      end

    end
  end
end
