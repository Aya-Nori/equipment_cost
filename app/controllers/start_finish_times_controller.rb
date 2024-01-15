class StartFinishTimesController < ApplicationController

  def index
    @divisions = User.pluck(:division).uniq
    selected_division = params[:selected_division]

    if selected_division.present?
      @start_finish_times = StartFinishTime.joins(:user).where(users: { division: selected_division })
      @selected_division = params[:selected_division]
    else
      @start_finish_times = StartFinishTime.all
    end
  end

end
