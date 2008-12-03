require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Forecast::Hourly do
  
  def test_forecast_data
    <<-XML
<STPeriod interval="1" Epoch="1228298400" Day="Wed" Date="2008-12-03" Time="10:00" Wx="Partly Cloudy" Icon="pcloudy.gif" TempC="0" TempF="32" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="70" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="SW" />
    XML
  end
  
  before(:each) do
    @hourly_forecast = Hamweather::Forecast::Hourly.new(test_forecast_data)
  end
  
  it "date should be 3rd December 2008" do
    @hourly_forecast.date.should == Date.parse("2008-12-03")
  end
  
  it "time should be 10:00" do 
    @hourly_forecast.time.should == "10:00"
  end
  
  it "expected_weather should be Partly Cloudy" do 
    @hourly_forecast.expected_weather.should == "Partly Cloudy"
  end
  
  it "temp_farenheit should be 32" do 
    @hourly_forecast.temp_farenheit.should == 32
  end
  
  it "temp_celsius should be 0" do 
    @hourly_forecast.temp_celsius.should == 0
  end
  
  it "probability_of_precipitation should be 10" do 
    @hourly_forecast.probability_of_precipitation.should == 10
  end
  
  it "precipitation_millimeters should be " do 
    @hourly_forecast.precipitation_millimeters.should == ""
  end
  
  it "precipitation_inches should be " do 
    @hourly_forecast.precipitation_inches.should == ""
  end
  
  it "dew_point_celsius should be -5" do 
    @hourly_forecast.dew_point_celsius.should == -5
  end
  
  it "dew_point_farenheit should be 23" do 
    @hourly_forecast.dew_point_farenheit.should == 23
  end
  
  it "relative_humidity should be 70" do 
    @hourly_forecast.relative_humidity.should == 70
  end
  
  it "wind_speed_knots should be 8" do 
    @hourly_forecast.wind_speed_knots.should == 8
  end
  
  it "wind_speed_mph should be 9" do 
    @hourly_forecast.wind_speed_mph.should == 9
  end
  
  it "wind_direction should be SW" do 
    @hourly_forecast.wind_direction.should == "SW"
  end
end