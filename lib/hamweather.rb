$:.unshift File.dirname(__FILE__)
require 'lib/hamweather/location'
require 'lib/hamweather/forecast'
require 'lib/hamweather/forecast/daily'
require 'lib/hamweather/forecast/hourly'
<<<<<<< HEAD:lib/hamweather.rb
 
=======

>>>>>>> e33d23e0ae002a8882daeec5a326e53b60e3abfd:lib/hamweather.rb
require 'date'
require 'hpricot'
 
module Hamweather
  
  class ApiKeyException < StandardError; end
  
  class << self
    
    attr_accessor :api_key
    
    def locate(place)
      check_api_key
    end
    
    def forecast(location, date)
      check_api_key
    end
    
    protected
    
    def check_api_key
      raise ApiKeyException unless self.api_key
    end
    
  end
  
end