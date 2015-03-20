module FeatureGenerator

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
  
end
