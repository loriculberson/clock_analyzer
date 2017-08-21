class HomeController < ApplicationController
  # respond_to :html, :json

  def index
    respond_to do |format|
      format.html 
      format.json do  
        if params[:time].present?
          time = params[:time]
          clock_analyzer = ClockAnalyzer.new(time)
          angle = clock_analyzer.compute_difference
          results = {
            time: time,
            angle: angle
          }
          render json: results
        else
          head :no_content
        end
      end
    end
  end
end
