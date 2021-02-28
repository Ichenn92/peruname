class PerformancesController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:show]

  def show
    @performance = Performance.find(params[:id])
  end

end
