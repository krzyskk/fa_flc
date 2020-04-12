# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:number_of_lesson_questions, :number_of_lesson_correct)
  end
end
