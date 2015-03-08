require 'fileutils'

class Runner
  def initialize
  end

  def self.application_generator(application_name, language)

  end


  def feature_generator(feature_name, language)
    feature_path = "#{name_cleaner(feature_name)}/model.#{language_extension_generator(language.downcase)}"
    
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