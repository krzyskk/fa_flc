class ChoresController < ApplicationController

  def index
    DaysCreator.new(current_user).call
    @chores = Chore.all
    @days = Day.all
  end

  def create
    @chore =  Day.find(params[:day_id]).chores.new(chore_params)

    respond_to do |format|
      if @chore.save
        format.js
      end
    end
  end

  def destroy
    @chore = Chore.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to chores_url, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def chore_params
      params.require(:chore).permit(:name, :day_id, :type)
    end
end
