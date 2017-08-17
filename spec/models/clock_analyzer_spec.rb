require 'rails_helper'

RSpec.describe ClockAnalyzer do 
    describe "#compute_difference" do 
    context "clock hands are in quadrants I and II" do 
       it "returns 172.5 angle difference between minute and hour hand" do 
        time = "9:15"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(172.5)
      end
     
      it "returns 115 angle difference between minute and hour hand" do 
        time = "10:10"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(115)
      end
    end

    context "clock hands are in both in quadrant II" do 
      it "returns 82.5 angle difference between minute and hour hand" do 
        time = "11:45"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(82.5)
      end
    end

    context "clock hands are in parallel to Y axis" do 
      it "returns 0 angle difference between minute and hour hand" do 
        time = "12:00"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(0)
      end
    end

    context "clock hands are in quadrants I and IV" do 
      it "returns 105 angle difference between minute and hour hand" do 
        time = "2:30"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(105)
      end
    end

    context "clock hands are in quadrant III and the X axis" do 
      it "returns 7.5 angle difference between minute and hour hand" do 
        time = "3:15"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(7.5)
      end
    end

    context "clock hands are both in quadrant IV" do 
      it "returns 40 angle difference between minute and hour hand" do 
        time = "5:20"
        clock_analyzer = ClockAnalyzer.new(time)

        expect(clock_analyzer.compute_difference).to eq(40)
      end
    end
  end
end