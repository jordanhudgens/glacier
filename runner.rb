require 'fileutils'
require './lib/ruby/ruby_generator.rb'

class Runner
  include RubyGenerator

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

  def feature_generator(feature_name, language)
    testing_string = "class HeyThere\n\n\s\sdef something()\n\s\s\s\sputs 'yay'\n\s\send\nend"
    server_config_string = "require 'webrick'\nserver = WEBrick::HTTPServer.new(:Port => 8080)\nserver.mount_proc('/') {|request, response| response.body = File.open('sample.html.erb')}\ntrap('INT') {server.shutdown}\nserver.start"

    paths = {}
    paths[:server] = "setup/server_config.#{language_extension_generator(language.downcase)}"
    paths[:model] = "application/#{name_cleaner(feature_name)}/model.#{language_extension_generator(language.downcase)}"
    paths[:controller] = "application/#{name_cleaner(feature_name)}/controller.#{language_extension_generator(language.downcase)}"
    paths[:views] = "application/#{name_cleaner(feature_name)}/views/index.html"
    paths[:routes] = "application/#{name_cleaner(feature_name)}/routes.#{language_extension_generator(language.downcase)}"

    paths.each do |key, value|
      dirname = File.dirname(value)

      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      if key == :server
        File.open(value, 'w+') { |f| f.write(server_config_string) }
      else
        File.open(value, 'w+') { |f| f.write(testing_string) }
      end
    end

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