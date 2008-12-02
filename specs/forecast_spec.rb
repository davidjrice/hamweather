require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Forecast do
  
  def test_forecast_data
    <<-XML
<FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/>    
    XML
  end
  
  before(:each) do
    @forecast = Hamweather::Forecast.new(test_forecast_data)
  end

  it "high_farenheit should be 66 degrees" do
    @forecast.high_farenheit.should == 66
  end
  
  it "high_celsius should be 19 degrees" do
    
  end

  it "low_farenheit should be 56 degrees" do

  end
  
  it "low_celsius should be 13 degrees" do

  end
  
  it "day should be friday" do
    
  end
  
  it "date should be the 14th of November 2008" do

  end
  
  it "expected_weather should be Chance T-storms" do

  end
  
  it "detail should be Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent." do

  end
  
  it "percentage_preciptiation should be 60 percent" do
  
  end
  
end


