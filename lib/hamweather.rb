$:.unshift File.dirname(__FILE__)
require 'lib/hamweather/location'
require 'lib/hamweather/forecast'
require 'lib/hamweather/forecast/daily'
require 'lib/hamweather/forecast/hourly'

require 'date'
require 'hpricot'
 
module Hamweather
  
  class ApiKeyException < StandardError; end
  class GoogleApiKeyException < StandardError; end
  
  class UnknownAddressError < StandardError; end
  
  class << self
    
    attr_accessor :api_key, :google_maps_api_key
    # Hamweather.api_key = "..."
    # Hamweather.google_maps_api_key = "..."
    # locations = Hamweather.locate "Belfast"
    # Hamweather.forecast(locations.first)

    def locate(place)
      check_api_key
      @location = Hamweather::Location.parse(place)
    end
    
    def forecast(location)
      check_api_key
      Hamweather::Forecast.new(location)
    end
    
    protected
    
    def check_api_key
      raise ApiKeyException.new("you must provide a Hamweather api key.") if api_key.nil? 
      raise ApiKeyException.new("you must provide a Google Maps api key.") if google_maps_api_key.nil?
    end
    
  end
  
end