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
    
    attr_accessor :api_key, :google_api_key
    google_api_key = 'ABQIAAAAuC9Wz6AZ_BvsKClq3zThQhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRAjq1Mt9DYkVx1c-jcuAsAreOT_w'
    
    def locate(place)
      check_api_key
      check_google_api_key
    end
    
    def forecast(location, date)
      check_api_key
    end
    
    protected
    
    def check_api_key
      raise ApiKeyException unless self.api_key
    end
    
    def check_google_api_key
      raise GoogleApiKeyException unless self.google_api_key
    end
    
  end
  
end