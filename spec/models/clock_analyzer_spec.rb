require 'rails_helper'

RSpec.describe ClockAnalyzer do 
  context "#compute_difference" do 
    it "returns 0 angle difference between minute and hour hand" do 

      time = "12:00"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(0)
    end

    it "returns 105 angle difference between minute and hour hand" do 

      time = "2:30"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(105)
    end

    it "returns 82.5 angle difference between minute and hour hand" do 

      time = "11:45"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(82.5)
    end
  end
end