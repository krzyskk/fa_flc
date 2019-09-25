class ResultsController < ApplicationController
  def toggle
    Result.find(params[:id]).toggle!(:success)
  end
end
