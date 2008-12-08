require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Location do
  
  describe "with zipcode 12834" do
    
    # should be a valid zipcode (Greenwich, NY, USA)
    
    before(:each) do
      @location = Hamweather::Location.new("12834")
    end
    
    it ".to_uri" do
      @location.to_uri.should == "/wx/12834.xml"
    end
    
  end
  
  describe "with postcode H0H0H0" do
    
    # should be a valid postcode (Santa, Lapland, CA)
    
    before(:each) do
      @location = Hamweather::Location.new("H0H0H0")
    end
    
    it ".to_uri" do
      @location.to_uri.should == "/wx/H0H0H0.xml"
    end
    
  end
  
  describe "with an unambiguous address, '575 Burton Road, Greenwich, NY, 12834" do
    #Returns one option
  end
  
  describe "with an ambiguous address, 'Greenwich, USA" do
    #Returns 10 options, nb, no 'NY' in search string
  end
  
  it "Location.parse should return xml string when zipcode" do
    pending
  end
  
end