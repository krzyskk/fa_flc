class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :destroy]

  def new
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to @lesson, notice: 'Lesson was successfully created.'
    else
      redirect_to @cards, notice: 'Error'
    end
  end

  def show

  end

  def finish

  end

  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.permit(:started_at, :wrong_answers, :correct_answers)
    end
end
