require 'fileutils'
require './lib/ruby/ruby_generator.rb'
require './lib/features/feature_generator.rb'

class Runner
  include RubyGenerator
  include FeatureGenerator

  def initialize
    puts "What is the name of the application?"
    @application_name = gets.chomp

    puts "What language do you want to use?"
    language = gets.chomp

    application_generator(@application_name, language)
    puts "Application: #{@application_name} has been created"
  end

  def application_generator(application_name, language)
    server_config_string = ruby_server_connection
    application_yml_string = application_yml_config

    paths = {}
    paths[:server] = "setup/application.#{language_extension_generator(language.downcase)}"
    paths[:application_yml] = "setup/application.yml"

    paths.each do |key, value|
      dirname = File.dirname(value)

      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      if key == :server
        File.open(value, 'w+') { |f| f.write(server_config_string) }
      elsif key == :application_yml
        File.open(value, 'w+') { |f| f.write(application_yml_string) }
      end
    end
  end

  def application_yml_config
    "application_name:#{@application_name}"
  end

  

  def name_cleaner(name)
    name.downcase.gsub(" ", "_")
  end

  def language_extension_generator(language)
    if language == "python"
      "py"
    elsif language == "ruby"
      "rb"
    end
  end

end

app = Runner.new

# app.application_generator("my cool feature 2", "ruby")