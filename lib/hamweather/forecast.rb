module Hamweather
  
  #forecast = Hpricot.parse('<FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/>').root
  class Forecast    
    
    attr_accessor :high_farenheit, :high_celsius, :low_farenheit, :low_celsius, :day, :date, :expected_weather, :detail, :percentage_precipitation
    
    # @forecast.each_day 
    # => day_proxy_object.high_farenheit
    # @forecast.each_hour
    # => hour_proxy_object.high_farenheit
    
    
    #high_farenheit = FPeriod/HiF
    #high_celsius = FPeriod/HiC
    #low_farenheit = FPeriod/LoF
    #low_celsius = FPeriod/LoC
    #day = FPeriod/Day
    #date = FPeriod/Date
    #expected_weather = FPeriod/Wx
    #detail = FPeriod/Detail
    #percentage_preciptiation = FPeriod/Pop

    def initialize(xml_data)
      forecast = Hpricot.parse(xml_data).root
      
      @high_farenheit = forecast[:hif]
      @high_celsius = forecast[:hic]
      @low_farenheit = forecast[:lof]
      @low_celsius = forecast[:loc]
      @day = forecast[:day]
      @date = forecast[:date]
      @expected_weather = forecast[:wx]
      @detail = forecast[:detail]
      @percentage_preciptiation = forecast[:pop]
    end

  end  
end