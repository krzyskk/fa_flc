class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  def index
    @days = Day.all
    @day = Day.new
    Habit.where(active: true).each do |habit|
      @day.results.build(habit: habit)
    end 
  end

  def create
    @day = Day.new(day_params)
    @day.save
    redirect_to action: :index, notice: 'Day was successfully created.' 
  end

  def update
    respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to @days, notice: 'Day was successfully updated.' }
      end
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
      params.require(:day).permit(:date, results_attributes: [:success])
    end
end
