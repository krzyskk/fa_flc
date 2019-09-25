class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  def index
    DaysCreator.new(current_user).call
    @days = current_user.days.all
    @day = Day.new
    @habits = current_user.habits.active

  end

  def toggle_result
    result = Result.find_by(day: params[id], habit: params[:habit_id])
    result.update_attribute(succes: !result.succes)
  end

  def edit

    # Habit.where(active: true).each do |habit|
    #   @day.results.build(habit: habit)
    # end
  end
  def create
    @day = Day.new(day_params)
    @day.save
    redirect_to action: :index, notice: 'Day was successfully created.' 
  end

  def update
    binding.pry
    if @day.update(day_params)
      redirect_to action: :index, notice: 'Day was successfully updated.' 
    end
  end

  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to days_url, notice: 'Day was successfully destroyed.' }
    end
  end

  private
    def set_day
      @day = Day.find(params[:id])
    end

    def day_params
      params.require(:day).permit(:note, :main_task, :user_id, :resolution, results_attributes: [:success])
    end
end
