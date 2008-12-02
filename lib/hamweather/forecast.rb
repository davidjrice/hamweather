module Hamweather
  
  #<FPeriod interval="1" Day="FRI" Date="2008-11-14" Wx="Chance T-storms" Icon="tstorm.gif" HiF="66" HiC="19" LoF="56" LoC="13" Pop="60" Detail="Occasional showers with a chance of thunderstorms. Areas of fog. Some thunderstorms May be severe after midnight. Lows in the mid 50s. South winds 5 to 10 mph shifting to the southwest 10 to 15 mph after midnight. Chance of rain near 100 percent."/>    
  class Forecast    
    #high_farenheit = FPeriod/HiF
    #high_celsius = FPeriod/HiC
    #low_farenheit = FPeriod/LoF
    #low_celsius = FPeriod/LoC
    #day = FPeriod/Day
    #date = FPeriod/Date
    #expected_weather = FPeriod/Wx
    #detail = FPeriod/Detail
    #percentage_preciptiation = FPeriod/Pop
    def new(xml_data)
      
      @high_farenheit = ""
    end
    
    def parse_xml (xml_uri)
      FIELDS = %w[HiF HiC LoF LoC Day Date Wx Detail Pop]

      doc = Hpricot.parse(File.read(xml_uri))
      (doc/:product).each do |xml_product|
        product = Product.new
        for field in FIELDS
          product[field] = (xml_product/field.intern).first.innerHTML
        end
        product.save
      end
      
    end

  end
  
end