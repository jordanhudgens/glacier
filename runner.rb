require 'fileutils'

class Runner
  def initialize
  end

  def application_generator(application_name, language)
    # TODO pull in the server configuration options for the specific language
  end


  def feature_generator(feature_name, language)
    testing_string = "class HeyThere\n\n\s\sdef something()\n\s\s\s\sputs 'yay'\n\s\send\nend"

    paths = []
    paths << "#{name_cleaner(feature_name)}/model.#{language_extension_generator(language.downcase)}"
    paths << "#{name_cleaner(feature_name)}/controller.#{language_extension_generator(language.downcase)}"
    paths << "#{name_cleaner(feature_name)}/views/index.html"
    paths << "#{name_cleaner(feature_name)}/routes.#{language_extension_generator(language.downcase)}"

    paths.each do |path|
      dirname = File.dirname(path)

      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      File.open(path, 'w+') { |f| f.write(testing_string)  }
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

  def ruby_server
    require 'webrick'
    server = WEBrick::HTTPServer.new(:Port => 8080)
    server.mount_proc('/') {|request, response| response.body = File.open("sample.html.erb")}
    server.mount_proc('/coolstory') {|request, response| response.body = File.open("coolstory.html.erb")}
    trap("INT") {server.shutdown}
    server.start
  end


end

app = Runner.new

app.feature_generator("my cool feature 2", "ruby")