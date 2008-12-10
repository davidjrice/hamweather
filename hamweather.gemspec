Gem::Specification.new do |s|
  s.name     = "hamweather"
  s.version  = "0.0.1"
  s.date     = "2008-10-13"
  s.summary  = "	Ruby Client API for Hamweather Weather Service (http://www.hamweather.com)"
  s.email    = "david@contrast.ie"
  s.homepage = "http://github.com/davidjrice/hamweather"
  s.description = "Client API for Hamweather Weather Service (http://www.hamweather.com)"
  s.has_rdoc = true
  s.authors  = ["David Rice", "David Lowry"]
  s.files    = ["Manifest", 
		"README", 
		"Rakefile", 
		"hamweather.gemspec",
		"lib/hamweather/forecast/daily.rb",
		"lib/hamweather/forecast/hourly.rb",
    "lib/hamweather/forecast.rb",
    "lib/hamweather/location.rb",
    "lib/hamweather.rb"]
  s.test_files = ["spec/daily_spec.rb",
      "spec/forecast_spec.rb",
      "spec/hamweather_spec.rb",
      "spec/hourly_spec.rb",
      "spec/location_spec.rb",
      "spec/spec_helper.rb"]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["Manifest", "README"]
  s.add_dependency("google-geo", ["> 0.0.0"])
end