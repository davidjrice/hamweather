require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Forecast::Daily do
  
  def test_forecast_data
    <<-XML
<WeatherFeed><Location ID="12834" name="Greenwich" state="NY" country="US" tz="-5" tzname="EST" ><Astro><AstroPeriod Day="WED" Date="2008-12-03" Sunrise="7:06 AM EST" Sunset="4:19 PM EST" Moonrise="11:19 AM EST" Moonset="9:45 PM EST" MoonIllum="44%" MoonAge="6" MoonPhase="Waxing Crescent Moon" MoonIcon="6" /><AstroPeriod Day="WED" Date="2008-12-03" Sunrise="7:07 AM EST" Sunset="4:19 PM EST" Moonrise="11:41 AM EST" Moonset="10:50 PM EST" MoonIllum="50%" MoonAge="7" MoonPhase="First Quarter Moon" MoonIcon="7" /></Astro><WxOb StationID="KGFL" TempC="-4" TempF="25"  ApparentC="-7" ApparentF="19" DewPointC="-5" DewPointF="23" RelativeHumidity="93" WindSpeedKnots="4" WindSpeedMPH="5" WindDirection="200" WindDirectionEng="SSW"  WindGustKnots="0" WindGustMPH="0"  PressureMB="1022" PressureIN="30.15" Wx="Fog/mist"   Icon="fog.gif" Visibility="3SM" VisibilityKM="4.83" VisibilityMI="3" ReportEpoch="1228302540" ReportDate="2008-12-03 11:09 UTC"  /><WxShortTerm ID="NYZ084"><STPeriod interval="1" Epoch="1228298400" Day="Wed" Date="2008-12-03" Time="10:00" Wx="Partly Cloudy" Icon="pcloudy.gif" TempC="0" TempF="32" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="70" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="SW" /></WxShortTerm><WxForecast ID="NYZ084"><FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/></WxForecast></Location></WeatherFeed>
    XML
  end
  
  before(:each) do
    @forecast = Hamweather::Forecast.new(test_forecast_data)
  end
  
  it "dailies{} should not be empty" do
    @forecast.dailies.empty?.should be_false
  end
  
  it "each_day should yield Daily objects" do
    @forecast.each_day do |day|
      day.class.should == Hamweather::Forecast::Daily
    end
  end
  
  it "hourlies{} should not be empty" do
    @forecast.hourlies.empty?.should be_false
  end
  
  it "each_hour should yield Hourly objects" do
    @forecast.each_hour do |hour|
      hour.class.should == Hamweather::Forecast::Hourly
    end
  end

end