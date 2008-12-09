require 'net/http'
require 'uri'

module Hamweather
  class Forecast

    # @forecast.each_day 
    # => day_proxy_object.high_farenheit
    # @forecast.each_hour
    # => hour_proxy_object.high_farenheit
    
    attr_accessor :forecast, :dailies, :hourlies
    
    def initialize(location)
      # Construct url from api key, location uri
      # Request url, get xml then parse
      xml_data = self.class.fetch(location.to_uri).gsub!(/\n/,'')
      data = Hpricot.parse(xml_data)
      
      @dailies = {}
      @hourlies = {}
            
      data.at(:wxforecast).children.each do |day| 
        #TODO make ordered hash
        @dailies[day[:date].to_s] = Daily.new(day)
      end
      
      data.at(:wxshortterm).children.each do |hour|
        #TODO make ordered hash
        @hourlies[hour[:time]] = Hourly.new(hour)
        @dailies[hour[:date]].hours[hour[:time]] = Hourly.new(hour)
      end
    end
    
    # TODO stub out calls to this where possible.
    # TODO / or raise an error.
    def self.fetch(location_uri)
      Net::HTTP.get URI.parse("http://hwlite.hamweather.net/#{Hamweather.api_key}/#{location_uri}")
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
