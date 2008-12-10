require File.dirname(__FILE__) + '/spec_helper'

describe Hamweather do
  
  describe "with no configuration" do
    
    it "should raise an ApiKeyException" do
      lambda { Hamweather.locate('Belfast') }.should raise_error(Hamweather::ApiKeyException)
    end
  
    it "should raise an ApiKeyException" do
      lambda { Hamweather.forecast(mock(Hamweather::Location)) }.should raise_error(Hamweather::ApiKeyException)
    end

  end
  
  describe "with a normal configuration" do
    
    before(:each) do 
      setup_google_api_config
      setup_hamweather_api_config
      @location = Hamweather.locate('Belfast')
      @forecast = Hamweather.forecast(@location)
    end
    
    it "should give a location" do
      @location.kind_of?(Hamweather::Location).should be_true
    end
    
    it "should give a forecast" do
      @forecast.kind_of?(Hamweather::Forecast).should be_true
    end
  end
  
end

    