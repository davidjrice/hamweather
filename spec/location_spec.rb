require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather::Location do
  
  before(:each) do 
    setup_google_api_config
  end
  
  describe "with zipcode 12834" do
    
    # should be a valid zipcode (Greenwich, NY, USA)
    
    before(:each) do
      @location = Hamweather::Location.parse("12834")
    end
    
    it ".to_uri should be 'wx/12834.xml'" do
      @location.to_uri.should == "wx/12834.xml"
    end
    
  end
  
  describe "with postcode H0H0H0" do
    
    # should be a valid postcode (Santa, Lapland, CA)
    
    before(:each) do
      @location = Hamweather::Location.parse("H0H0H0")
    end
    
    it ".to_uri should be 'wx/H0H0H0.xml'" do
      @location.to_uri.should == "wx/H0H0H0.xml"
    end
    
  end
  
  describe "with an unambiguous address, '575 Burton Road, Greenwich, NY, 12834'" do
    #Returns one option
    
    before(:each) do
      @location = Hamweather::Location.parse('575 Burton Road, Greenwich, NY, 12834')
    end
    
    it "should return one location object" do
      #Google::Geo.should_receive(:new).with('thisapikey').and_return(mock(Google::Geo))
      #so if you are using should_receive i'd put it in the actual it block of the spec
      #so you should create the mock object first, set an expectation that ".locate" is called on it... then set the expectation that it's instantiated too!
      @location.kind_of?(Hamweather::Location).should be_true
    end
    
    it ".to_uri should be 'wx/nearby.xml?lat=-73.504265&lon=43.0676821'" do
      @location.to_uri.should == "wx/nearby.xml?lat=43.0676821&lon=-73.504265"
    end
  end
  
  describe "with an ambiguous address, 'Greenwich, USA" do
    #Returns circa 10 options, nb, no 'NY' or 'CT' in search string
    before(:each) do
      @location = Hamweather::Location.parse('Greenwich, USA')
    end
    
    it "should return an array of location objects" do
      @location.kind_of?(Array).should be_true
      @location.should_not be_empty
    end
  end
  
  describe "with an unlocatable address" do

    it "should raise a Hamweather::UnknownAddressError" do
      
      lambda { Hamweather::Location.parse('') }.should raise_error(Hamweather::UnknownAddressError)
      
    end
    
  end
end
