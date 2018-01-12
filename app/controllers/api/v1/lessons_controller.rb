module Api
  module V1
    class LessonsController < ::Api::V1::BaseController
      before_action :current_lesson
      def next_question
        @lesson = current_lesson
        @last_answer = @lesson.answers.last
        @last_answer.answer = params[:answer]
        @last_answer.save!
        @last_card = Card.find(@last_answer.card_id)

        if @lesson.correct_answers < current_user.number_of_lesson_correct

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

        else
          @lesson.finished = true
          @lesson.save
          card =  @last_card.id

        end

          @new_answer = @lesson.answers.new
          @new_answer.answer = ''
          @new_answer.card_id = card
          @new_answer.save!



        resp = {previous: @last_card.front,
                your: @last_answer.answer,
                status: @last_answer.status,
                correct: @last_card.back,
                question: Card.find(@new_answer.card_id).front,
                number_of_questions: @lesson.number_of_answers,
                number_of_correct: @lesson.correct_answers,
                answers: @lesson.answers,
                status: @lesson.finished }
        render json: resp
      end
    end
  end
end
