require 'rubygems'
require 'google/geo'

module Hamweather
  
  class Location
    
    attr_reader :string, :lat, :lon
    
    def to_uri
      if zipcode? || postcode?
        @uri ||= "/wx/#{string}.xml"
      elsif geocode? 
        @uri ||= "/wx/nearby.xml?lat=#{lat}&lon=#{lon}"
      end
    end
    
    def zipcode?
      @kind == :zipcode
    end
    
    def postcode?
      @kind == :postcode
    end
    
    def geocode?
      @kind == :geocode
    end
    
    def initialize(string)
      @string = string
      if self.class.is_zipcode?(string)
        @kind = :zipcode
      elsif self.class.is_postcode?(string)
        @kind = :postcode
      else
        @kind = :geocode
      end
      
    end

    def self.parse(string)
      if is_zipcode?(string) || is_postcode(string)
        return self.new(string)
      else 
        # geolocate
        addresses = get_geocodes(data)
        # return location
        # or array of locations
        
        if addresses.size > 1 then
          # Provide options to select correct google 'address'
          addresses.each do |a|
            locations[a.full_address] = self.new(a.full_address)
          end
        elsif (addresses.size == 1)
          lat = addresses.first.latitude
          lon = addresses.first.longitude
        end
         # 0 addresses/errors will already have been picked up by Hamweather::UnknownAddressError
      end
    end
      
    def Location.parse (data)
      # is it a zipcode? then we can request the api directly
      # http://hwlite.hamweather.net/wxC1E2gT8AY7/wx/ZIPCODE.xml (US)
      if is_zipcode(data)
        data_uri = "http://hwlite.hamweather.net/wxC1E2gT8AY7/wx/"+data+".xml"
      end
      
      # is it a canadian postcode?  
      # http://hwlite.hamweather.net/wxC1E2gT8AY7/wx/POSTALCODE.xml (CANADA)
      if is_canadian_postcode(data)
        data_uri = "http://hwlite.hamweather.net/wxC1E2gT8AY7/wx/"+data+".xml"
      end

      # is it a place name? geocode it. then request the api
      # http://hwlite.hamweather.net/wxC1E2gT8AY7/wx/nearby.xml?lat=33.76&lon=-84.42
      # README: http://github.com/greatseth/google-geo/tree/master/README.textile
      addresses = get_geocodes(data)
      

    end
    
    # TODO: extract google maps api key to config variable. (Hamweather.google_maps_api_key = '...')
    def get_geocodes(string)
      #this key is on my (djlowry@gmail.com) google api account, change it before production
      geo = Google::Geo.new "ABQIAAAAuC9Wz6AZ_BvsKClq3zThQhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRAjq1Mt9DYkVx1c-jcuAsAreOT_w"
      addresses = geo.locate test

      rescue Google::Geo::UnknownAddressError 
        raise Hamweather::UnknownAddressError

      return addresses  # addresses is always an array
    end

    def self.is_zipcode(string)
      #Address: ZIP code (US)
      zip_codes_regex = /\b[0-9]{5}(?:-[0-9]{4})?\b/
      return string =~ zip_codes_regex
    end

    def self.is_canadian_postcode(string)
      #Rules: no D, F, I, O, Q, or U anywhere
      #    Basic validation:    ^[ABCEGHJ-NPRSTVXY]{1}[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[ ]?[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[0-9]{1}$
      #    Extended validation: ^(A(0[ABCEGHJ-NPR]|1[ABCEGHK-NSV-Y]|2[ABHNV]|5[A]|8[A])|B(0[CEHJ-NPRSTVW]|1[ABCEGHJ-NPRSTV-Y]|2[ABCEGHJNRSTV-Z]|3[ABEGHJ-NPRSTVZ]|4[ABCEGHNPRV]|5[A]|6[L]|9[A])|C(0[AB]|1[ABCEN])|E(1[ABCEGHJNVWX]|2[AEGHJ-NPRSV]|3[ABCELNVYZ]|4[ABCEGHJ-NPRSTV-Z]|5[ABCEGHJ-NPRSTV]|6[ABCEGHJKL]|7[ABCEGHJ-NP]|8[ABCEGJ-NPRST]|9[ABCEGH])|G(0[ACEGHJ-NPRSTV-Z]|1[ABCEGHJ-NPRSTV-Y]|2[ABCEGJ-N]|3[ABCEGHJ-NZ]|4[ARSTVWXZ]|5[ABCHJLMNRTVXYZ]|6[ABCEGHJKLPRSTVWXZ]|7[ABGHJKNPSTXYZ]|8[ABCEGHJ-NPTVWYZ]|9[ABCHNPRTX])|H(0[HM]|1[ABCEGHJ-NPRSTV-Z]|2[ABCEGHJ-NPRSTV-Z]|3[ABCEGHJ-NPRSTV-Z]|4[ABCEGHJ-NPRSTV-Z]|5[AB]|7[ABCEGHJ-NPRSTV-Y]|8[NPRSTYZ]|9[ABCEGHJKPRSWX])|J(0[ABCEGHJ-NPRSTV-Z]|1[ACEGHJ-NRSTXZ]|2[ABCEGHJ-NRSTWXY]|3[ABEGHLMNPRTVXYZ]|4[BGHJ-NPRSTV-Z]|5[ABCJ-MRTV-Z]|6[AEJKNRSTVWYXZ]|7[ABCEGHJ-NPRTV-Z]|8[ABCEGHLMNPRTVXYZ]|9[ABEHJLNTVXYZ])|K(0[ABCEGHJ-M]|1[ABCEGHJ-NPRSTV-Z]|2[ABCEGHJ-MPRSTVW]|4[ABCKMPR]|6[AHJKTV]|7[ACGHK-NPRSV]|8[ABHNPRV]|9[AHJKLV])|L(0[[ABCEGHJ-NPRS]]|1[ABCEGHJ-NPRSTV-Z]|2[AEGHJMNPRSTVW]|3[BCKMPRSTVXYZ]|4[ABCEGHJ-NPRSTV-Z]|5[ABCEGHJ-NPRSTVW]|6[ABCEGHJ-MPRSTV-Z]|7[ABCEGJ-NPRST]|8[EGHJ-NPRSTVW]|9[ABCGHK-NPRSTVWYZ])|M(1[BCEGHJ-NPRSTVWX]|2[HJ-NPR]|3[ABCHJ-N]|4[ABCEGHJ-NPRSTV-Y]|5[ABCEGHJ-NPRSTVWX]|6[ABCEGHJ-NPRS]|7[AY]|8[V-Z]|9[ABCLMNPRVW])|N(0[ABCEGHJ-NPR]|1[ACEGHKLMPRST]|2[ABCEGHJ-NPRTVZ]|3[ABCEHLPRSTVWY]|4[BGKLNSTVWXZ]|5[ACHLPRV-Z]|6[ABCEGHJ-NP]|7[AGLMSTVWX]|8[AHMNPRSTV-Y]|9[ABCEGHJKVY])|P(0[ABCEGHJ-NPRSTV-Y]|1[ABCHLP]|2[ABN]|3[ABCEGLNPY]|4[NPR]|5[AEN]|6[ABC]|7[ABCEGJKL]|8[NT]|9[AN])|R(0[ABCEGHJ-M]|1[ABN]|2[CEGHJ-NPRV-Y]|3[ABCEGHJ-NPRSTV-Y]|4[AHJKL]|5[AGH]|6[MW]|7[ABCN]|8[AN]|9[A])|S(0[ACEGHJ-NP]|2[V]|3[N]|4[AHLNPRSTV-Z]|6[HJKVWX]|7[HJ-NPRSTVW]|9[AHVX])|T(0[ABCEGHJ-MPV]|1[ABCGHJ-MPRSV-Y]|2[ABCEGHJ-NPRSTV-Z]|3[ABCEGHJ-NPRZ]|4[ABCEGHJLNPRSTVX]|5[ABCEGHJ-NPRSTV-Z]|6[ABCEGHJ-NPRSTVWX]|7[AENPSVXYZ]|8[ABCEGHLNRSVWX]|9[ACEGHJKMNSVWX])|V(0[ABCEGHJ-NPRSTVWX]|1[ABCEGHJ-NPRSTV-Z]|2[ABCEGHJ-NPRSTV-Z]|3[ABCEGHJ-NRSTV-Y]|4[ABCEGK-NPRSTVWXZ]|5[ABCEGHJ-NPRSTV-Z]|6[ABCEGHJ-NPRSTV-Z]|7[ABCEGHJ-NPRSTV-Y]|8[ABCGJ-NPRSTV-Z]|9[ABCEGHJ-NPRSTV-Z])|X(0[ABCGX]|1[A])|Y(0[AB]|1[A]))[ ]?[0-9]{1}[ABCEGHJ-NPRSTV-Z]{1}[0-9]{1}$
      ca_postcode_regex = /^[A-Z]{1}[\d]{1}[A-Z]{1}[ ]?[\d]{1}[A-Z]{1}[\d]{1}$/
      return string =~ ca_postcodes_regex
    end

  end  
end  
