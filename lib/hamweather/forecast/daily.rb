module Hamweather
  class Forecast::Daily
    #daily_forecast = Hpricot.parse('<FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/>').root
    attr_accessor :high_farenheit, :high_celsius, :low_farenheit, :low_celsius, :day, :date, :expected_weather, :detail, :probability_of_preciptiation

    def initialize(xml_data)
      daily_forecast = Hpricot.parse(xml_data).root

      @high_farenheit = daily_forecast[:hif].to_i
      @high_celsius = daily_forecast[:hic].to_i
      @low_farenheit = daily_forecast[:lof].to_i
      @low_celsius = daily_forecast[:loc].to_i
      @date = Date.parse(daily_forecast[:date])
      @expected_weather = daily_forecast[:wx]
      @detail = daily_forecast[:detail]
      @probability_of_preciptiation = daily_forecast[:pop].to_i
    end
    
  end
end