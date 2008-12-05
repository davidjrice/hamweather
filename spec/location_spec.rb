require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Location do
  
  #locations hash
  locations[:zipcode] = "12834" #Returns Greenwich, NY, USA
  locations[:ca_postcode] = "H0H0H0" #Returns Santa, Lapland, CA
  locations[:geocode_single] = "575 Burton Road, Greenwich, NY, 12834"  #Returns one option
  locations[:geocode_multi] = "Greenwich, USA"  #Returns 10 options, nb, no 'NY' in search string
  
  
  before(:each) do
    @location = Hamweather::Location.new()
  end
  
  it "dailies{} should not be empty" do
    @forecast.dailies.empty?.should be_false
  end
  
  it "hourlies{} should not be empty" do
    @forecast.hourlies.empty?.should be_false
  end
  
  

end