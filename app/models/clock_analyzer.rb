class ClockAnalyzer
  attr_reader :time

  def initialize(time)
    @time = time
  end

  def compute_difference
    if calc_diff_in_degrees > 180
      360 - calc_diff_in_degrees
    else
      calc_diff_in_degrees
    end
  end

  private
  def calc_diff_in_degrees
    (total_hours_in_degrees - total_minutes_in_degrees).abs
  end

  def total_hours_in_degrees
    calc_degrees_of_whole_hours + fractional_hour_in_degrees
  end

  def calc_degrees_of_whole_hours
      hours * 30
  end

  def fractional_hour_in_degrees
    ((total_minutes_in_degrees/360r).to_f * 30) 
  end

  def total_minutes_in_degrees
    minutes * 6
  end
 
  def time_parser
    /(\d+)\:(\d+)/.match(time)
  end

  def hours
    time_parser[1].to_i
  end

  def minutes
    time_parser[2].to_i
  end
end
