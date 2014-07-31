require 'yaml'
namespace :heroku do
  desc 'Set environmental variables on Heroku'
  task :set_keys do
    YAML.load(File.read("config/application.yml")).each do |key, value|
       system("heroku config:set #{key}=#{value}")
    end
  end
end
