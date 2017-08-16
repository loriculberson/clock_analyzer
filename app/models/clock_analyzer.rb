class ClockAnalyzer
  attr_reader :time

  def initialize(time)
    @time = time
  end

  def compute_difference
    if calc_degrees_minutes <= fractional_hour_in_degrees
      360 - calc_diff_in_degrees
    else
      calc_diff_in_degrees
    end
  end

  private
  def time_parser
    /(\d+)\:(\d+)/.match(time)
  end

  def hours
    time_parser[1].to_i
  end

  def minutes
    time_parser[2].to_i
  end

  def calc_degrees_hours
    (hours * 30) + fractional_hour_in_degrees
  end

  def fractional_hour_in_degrees
    ((calc_degrees_minutes/360r).to_f * 30)
  end

  def calc_degrees_minutes
    minutes * 6
  end

  def calc_diff_in_degrees
    (calc_degrees_hours - calc_degrees_minutes).abs
  end
end
