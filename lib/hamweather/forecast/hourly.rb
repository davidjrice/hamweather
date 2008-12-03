module Hamweather
  class Forecast::Hourly
      #hourly_forecast = Hpricot.parse('<STPeriod interval="1" Epoch="1228298400" Day="Wed" Date="2008-12-03" Time="10:00" Wx="Partly Cloudy" Icon="pcloudy.gif" TempC="0" TempF="32" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="70" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="SW" />').root
      attr_accessor :date, :time, :wx, :tempc, :tempf, :pop, :qpfmm, :qpfin, :dewpointc, :dewpointf, :relativehumidity, :windspeedknots, :windspeedmph, :winddirectioneng
      #redundant      :day, 
      def initialize(xml_data)
        hourly_forecast = Hpricot.parse(xml_data).root
        
        #@day = hourly_forecast[:day]
        @date = Date.parse(hourly_forecast[:date])
        @time = hourly_forecast[:time]
        @expected_weather = hourly_forecast[:wx]
        @temp_farenheit = hourly_forecast[:tempf]
        @temp_celsius = hourly_forecast[:tempc]
        @probability_of_preciptiation = hourly_forecast[:pop]
        @precipitation_millimeters = hourly_forecast[:qpfmm]
        @precipitation_inches = hourly_forecast[:qpfin]
        @dew_point_celsius = hourly_forecast[:dewpointc]
        @dew_point_farenheit = hourly_forecast[:dewpointf]
        @relative_humidity = hourly_forecast[:relativehumidity]
        @wind_speed_knots = hourly_forecast[:windspeedknots]
        @wind_speed_mph = hourly_forecast[:windspeedmph]
        @wind_direction = hourly_forecast[:winddirectioneng]
        @detail = hourly_forecast[:detail]
        
      end
      
  end
end