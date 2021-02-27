class PerformancesController < ApplicationController
  def search
    # Info to look at:
    #   address
    #   radius: default 5km
    #   shift(begin_time, end_time)
    #   category
    @performances = Performance.all
  end
end
