begin
  require 'echoe'
 
  Echoe.new('hamweather', '0.0.1') do |p|
    p.rubyforge_name = 'hamweather'
    p.summary      = "Hamweather is a Ruby client library for interacting with http://hamweather.com weather data"
    p.description  = "Hamweather is a Ruby client library for interacting with http://hamweather.com weather data"
    p.url          = "http://github.com/davidjrice/hamweather"
    p.author       = ['David Rice']
    p.email        = "david@contrast.ie"
    p.dependencies = ["json"]
  end
 
rescue LoadError => e
  puts "You are missing a dependency required for meta-operations on this gem."
  puts "#{e.to_s.capitalize}."
end
 
# add spec tasks, if you have rspec installed
begin
  require 'spec/rake/spectask'
 
  Spec::Rake::SpecTask.new("spec") do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--color']
  end
 
  task :test do
    Rake::Task['spec'].invoke
  end
 
  Spec::Rake::SpecTask.new("coverage") do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--color']
    t.rcov = true
    t.rcov_opts = ['--exclude', '^spec,/gems/']
  end

  
end