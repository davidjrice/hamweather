require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Location do
  
  describe "with zipcode 12834" do
    
    # should be a valid zipcode (Greenwich, NY, USA)
    
    before(:each) do
      @location = Hamweather::Location.parse("12834")
    end
    
    it ".to_uri should be '/wx/12834.xml'" do
      @location.to_uri.should == "/wx/12834.xml"
    end
    
  end
  
  describe "with postcode H0H0H0" do
    
    # should be a valid postcode (Santa, Lapland, CA)
    
    before(:each) do
      @location = Hamweather::Location.parse("H0H0H0")
    end
    
    it ".to_uri should be '/wx/H0H0H0.xml'" do
      @location.to_uri.should == "/wx/H0H0H0.xml"
    end
    
  end
  
  describe "with an unambiguous address, '575 Burton Road, Greenwich, NY, 12834" do
    #Returns one option
    
    it "should return one location object"
    
  end
  
  describe "with an ambiguous address, 'Greenwich, USA" do
    #Returns 10 options, nb, no 'NY' in search string
    before(:each) do
      @location = Hamweather::Location.parse("Greenwich, USA")
    end
    
    it "should return an array of location objects"
    
  end
  
  
end