require 'rubygems'
require File.dirname(__FILE__) + '/../lib/hamweather'


def setup_google_api_config 
  Hamweather.google_maps_api_key = "ABQIAAAAuC9Wz6AZ_BvsKClq3zThQhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRAjq1Mt9DYkVx1c-jcuAsAreOT_w"
end

def setup_hamweather_api_config
  Hamweather.api_key = "wxC1E2gT8AY7"
end