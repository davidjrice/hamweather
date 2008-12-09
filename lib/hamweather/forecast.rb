module Hamweather
  class Forecast

    # @forecast.each_day 
    # => day_proxy_object.high_farenheit
    # @forecast.each_hour
    # => hour_proxy_object.high_farenheit
    
    attr_accessor :forecast, :dailies, :hourlies
    
    def initialize(xml_data)

      data = Hpricot.parse(xml_data)
      
      @dailies = {}
      @hourlies = {}
            
      data.at(:wxforecast).children.each do |day| 
        @dailies[day[:date].to_s] = Daily.new(day)
      end
      
      data.at(:wxshortterm).children.each do |hour|
        @hourlies[hour[:time]] = Hourly.new(hour)
      end
      
    end
    
    
    def each_day
      @dailies.each_pair do |key, value|
        yield value
      end
    end
    
    def each_hour
      @hourlies.each_pair do |key, value|
        yield value
      end
    end
    
  
  end
end
