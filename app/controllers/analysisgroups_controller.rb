class AnalysisgroupsController < ApplicationController
  def index
    @equipments = Equipment.all.includes(:user)
  end

  
end
