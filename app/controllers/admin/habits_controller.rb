module Admin
  class HabitsController < Admin::ApplicationController
    def new
      super
      @resource = Habit.new(user_id: current_user.id)

    end

    def create
      super
    end
  end
end
