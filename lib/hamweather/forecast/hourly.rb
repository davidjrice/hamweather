module Hamweather
  class Forecast::Hourly
      #hourly = Hpricot.parse('<STPeriod interval="1" Epoch="1228298400" Day="Wed" Date="2008-12-03" Time="10:00" Wx="Partly Cloudy" Icon="pcloudy.gif" TempC="0" TempF="32" Pop="10" QPFmm="" QPFin="" DewPointC="-5" DewPointF="23" RelativeHumidity="70" WindSpeedKnots="8" WindSpeedMPH="9"  WindDirectionEng="SW" />').root
      attr_accessor :day, :date, :time, :wx, :tempc, :tempf, :pop, :qpfmm, :qpfin, :dewpointc, :dewpointf, :relativehumidity, :windspeedknots, :windspeedmph, :winddirectioneng
      
      def initialize(xml_data)
        hourly = Hpricot.parse(xml_data).root
        
        @day = hourly[:day]
        @date = Date.new(hourly[:date])
        @expected_weather = hourly[:wx]
        @time = 
        @high_farenheit = hourly[:hif]
        @high_celsius = hourly[:hic]
        @low_farenheit = hourly[:lof]
        @low_celsius = hourly[:loc]
        @detail = hourly[:detail]
        @probability_of_preciptiation = hourly[:pop]
      end
      
  end
end