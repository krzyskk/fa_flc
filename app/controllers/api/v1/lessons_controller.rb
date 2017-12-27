module Api
  module V1
    class LessonsController < ::Api::V1::BaseController
      def next_question
        answer = params[:json_data]
        render json: resp
      end

      private

      def resp
        return {previous: 'previous question',
                your: 'your answer',
                correct: 'correct answer',
                question: 'question',
                number_of_questions: '0',
                number_of_correct: '0'}
      end
    end
  end
end
