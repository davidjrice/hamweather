require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Location do
  
  #locations hash
  #locations[:test][:data] = "str"
  #locations[:test][:result] = true/false
  locations[:zipcode][:data] = "12834" #Returns Greenwich, NY, USA
  locations[:ca_postcode][:data] = "H0H0H0" #Returns Santa, Lapland, CA
  locations[:geocode_single][:data] = "575 Burton Road, Greenwich, NY, 12834"  #Returns one option
  locations[:geocode_multi][:data] = "Greenwich, USA"  #Returns 10 options, nb, no 'NY' in search string
  
  before(:each) do
    @location = Hamweather::Location.new()
  end

  it "Location.parse should return xml string when zipcode" do
    pending
  end
end