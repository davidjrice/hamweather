module Hamweather
  class Forecast

    # @forecast.each_day 
    # => day_proxy_object.high_farenheit
    # @forecast.each_hour
    # => hour_proxy_object.high_farenheit
    
    attr_accessor :forecast, :days
    
    def initialize(xml_data)
      #Take XML Data
      #   <WeatherFeed>
      #     <Location ID="12834" name="Greenwich" state="NY" country="US" tz="-5" tzname="EST" >
      #       <WxShortTerm ID="NYZ084">
      #         <STPeriod interval="1" Epoch="1228298400" Day="Wed" Date="2008-12-03" Time="10:00" Wx="Partly Cloudy" Icon="pcloudy.gif" TempC="0" TempF="32" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="70" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="SW" />
      #         <STPeriod interval="2" Epoch="1228309200" Day="Wed" Date="2008-12-03" Time="13:00" Wx="Partly Cloudy" Icon="pcloudy.gif" TempC="5" TempF="41" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="48" WindSpeedKnots="9" WindSpeedMPH="10"  WindDirectionEng="SW" />
      #         <STPeriod interval="3" Epoch="1228320000" Day="Wed" Date="2008-12-03" Time="16:00" Wx="Mostly Cloudy" Icon="mcloudy.gif" TempC="4" TempF="39" Pop="10" QPFmm="" QPFin="" DewPointC="-4" DewPointF="24" RelativeHumidity="54" WindSpeedKnots="7" WindSpeedMPH="8"  WindDirectionEng="S" />
      #         <STPeriod interval="4" Epoch="1228330800" Day="Wed" Date="2008-12-03" Time="19:00" Wx="Partly Cloudy" Icon="pcloudyn.gif" TempC="1" TempF="34" Pop="10" QPFmm="" QPFin="" DewPointC="-4" DewPointF="25" RelativeHumidity="69" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="S" />
      #         <STPeriod interval="5" Epoch="1228341600" Day="Wed" Date="2008-12-03" Time="22:00" Wx="Partly Cloudy" Icon="pcloudyn.gif" TempC="-1" TempF="31" Pop="10" QPFmm="" QPFin="" DewPointC="-4" DewPointF="24" RelativeHumidity="74" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="S" />
      #         <STPeriod interval="6" Epoch="1228352400" Day="Thu" Date="2008-12-04" Time="01:00" Wx="Partly Cloudy" Icon="pcloudyn.gif" TempC="-1" TempF="30" Pop="10" QPFmm="" QPFin="" DewPointC="-4" DewPointF="24" RelativeHumidity="76" WindSpeedKnots="9" WindSpeedMPH="10"  WindDirectionEng="S" />
      #         <STPeriod interval="7" Epoch="1228363200" Day="Thu" Date="2008-12-04" Time="04:00" Wx="Partly Cloudy" Icon="pcloudyn.gif" TempC="-1" TempF="31" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="70" WindSpeedKnots="10" WindSpeedMPH="12"  WindDirectionEng="S" />
      #         <STPeriod interval="8" Epoch="1228374000" Day="Thu" Date="2008-12-04" Time="07:00" Wx="Partly Cloudy" Icon="pcloudyn.gif" TempC="0" TempF="32" Pop="10" QPFmm="" QPFin="" DewPointC="-4" DewPointF="25" RelativeHumidity="74" WindSpeedKnots="11" WindSpeedMPH="13"  WindDirectionEng="S" />
      #       </WxShortTerm>
      #       <WxForecast ID="NYZ084">
      #         <FPeriod interval="1" Day="WED" Date="2008-12-03" Wx="Partly Cloudy" Icon="pcloudy.gif"  HiF="42" HiC="6" LoF="22" LoC="-6" Pop="0"  />
      #         <FPeriod interval="2" Day="THU" Date="2008-12-04" Wx="Slight Chance Light Snow Showers" Icon="snowshowers.gif"  HiF="45" HiC="7" LoF="24" LoC="-4" Pop="40"  />
      #         <FPeriod interval="3" Day="FRI" Date="2008-12-05" Wx="Slight Chance Light Snow Showers" Icon="snowshowers.gif"  HiF="32" HiC="0" LoF="21" LoC="-6" Pop="20"  />
      #         <FPeriod interval="4" Day="SAT" Date="2008-12-06" Wx="Slight Chance Light Snow" Icon="snow.gif"  HiF="31" HiC="-1" LoF="18" LoC="-8" Pop="20"  />
      #         <FPeriod interval="5" Day="SUN" Date="2008-12-07" Wx="Chance Light Snow" Icon="snow.gif"  HiF="31" HiC="-1" LoF="18" LoC="-8" Pop="40"  />
      #         <FPeriod interval="6" Day="MON" Date="2008-12-08" Wx="Partly Cloudy" Icon="pcloudy.gif"  HiF="29" HiC="-2" LoF="18" LoC="-8" Pop="0"  />
      #         <FPeriod interval="7" Day="TUE" Date="2008-12-09" Wx="Chance Light Snow" Icon="snow.gif"  HiF="30" HiC="-1" LoF="16" LoC="-9" Pop="30"  />
      #       </WxForecast>
      data = Hpricot.parse(xml_data)
      
      dailies, hourlies = {}
      
      data.at(:wxforecast).children.each do |day| 
        dailies[day[:date]] = Daily.new(day)
      end
      
      data.at(:wxshortterm).children.each do |hour|
        hourlies[hour[:time]] = Hourly.new(hour)
      end
      
    end
  
  end
end
