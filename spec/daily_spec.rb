require File.dirname(__FILE__) + '/spec_helper'

#Hpricot.parse('<FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/>').root
#=> {emptyelem <fperiod loc="13" wx="Chance T-storms" hic="19" lof="56" icon="tstorm.gif" date="2008-11-14" hif="66" pop="60" day="FRI" interval="1" detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent.">}

describe Hamweather::Forecast::Daily do
  
  def test_forecast_data
    <<-XML
<FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/>    
    XML
  end
  
  before(:each) do
    @daily_forecast = Hamweather::Forecast::Daily.new(Hpricot.parse(test_forecast_data).root)
  end

  it "high_farenheit should be 66 degrees" do
    @daily_forecast.high_farenheit.should == 66
  end
  
  it "high_celsius should be 19 degrees" do
    @daily_forecast.high_celsius.should == 19
  end

  it "low_farenheit should be 56 degrees" do
    @daily_forecast.low_farenheit.should == 56
  end
  
  it "low_celsius should be 13 degrees" do
    @daily_forecast.low_celsius.should == 13
  end
  
  it "date should be the 14th of November 2008" do
    @daily_forecast.date.should == Date.parse("2008-11-14")
  end
  
  it "expected_weather should be Chance T-storms" do
    @daily_forecast.expected_weather.should == "Chance T-storms"
  end
  
  it "probability_of_preciptiation should be 60 percent" do
    @daily_forecast.probability_of_preciptiation.should == 60
  end
  
  it "detail should be Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent." do
    @daily_forecast.detail.should == "Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."
  end
  
  it "@hours should contain only hours belonging to 'today'" do
    pending
  end
end


