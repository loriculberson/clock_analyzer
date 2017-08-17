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

    it "returns 7.5 angle difference between minute and hour hand" do 

      time = "3:15"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(7.5)
    end

    it "returns 40 angle difference between minute and hour hand" do 

      time = "5:20"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(40)
    end

    it "returns 115 angle difference between minute and hour hand" do 

      time = "10:10"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(115)
    end

    it "returns 172.5 angle difference between minute and hour hand" do 

      time = "9:15"
      clock_analyzer = ClockAnalyzer.new(time)

      expect(clock_analyzer.compute_difference).to eq(172.5)
    end

  end
end