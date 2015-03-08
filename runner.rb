require 'fileutils'

class Runner
  def initialize
  end

  def application_generator(application_name, language)

  end


  def feature_generator(feature_name, language)
    model_path = "#{name_cleaner(feature_name)}/model.#{language_extension_generator(language.downcase)}"
    controller_path = "#{name_cleaner(feature_name)}/controller.#{language_extension_generator(language.downcase)}"
    views_path = "#{name_cleaner(feature_name)}/views/index.html"
    routes_path = "#{name_cleaner(feature_name)}/routes.#{language_extension_generator(language.downcase)}"

    paths = [model_path, controller_path, views_path, routes_path]

    paths.each do |path|
      dirname = File.dirname(path)

      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      File.open(path, 'w+') { |f| f.write("write your stuff here")  }
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

app.feature_generator("my cool app", "ruby")

# dirname = File.dirname(some_path)

# unless File.directory?(dirname)
#   FileUtils.mkdir_p(dirname)
# end

# File.open(some_path, 'w+') { |f| f.write("write your stuff here")  }

# # out_file = File.new("testing/out.txt", "w")

# # out_file.puts()

# out_file.close