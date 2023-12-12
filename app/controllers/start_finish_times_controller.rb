class StartFinishTimesController < ApplicationController
  def index
    @start_finish_times = StartFinishTime.includes(:user, :equipment).all
  end
end
