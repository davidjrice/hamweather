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

  it "high_farenheit should be 56 degrees" do
    
  end

end