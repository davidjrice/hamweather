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
  
end

    