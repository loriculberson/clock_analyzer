class HomeController < ApplicationController

  def index
    if params[:time].present?
      @time = params[:time]
      clock_analyzer = ClockAnalyzer.new(@time)
      @angle = clock_analyzer.compute_difference
    end
  end
end
