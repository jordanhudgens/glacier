module FeatureGenerator

  def feature_generator(feature_name, language)
    paths = {}

    paths[:model] = "features/#{name_cleaner(feature_name)}/model.#{language_extension_generator(language.downcase)}"
    paths[:controller] = "features/#{name_cleaner(feature_name)}/controller.#{language_extension_generator(language.downcase)}"
    paths[:views] = "features/#{name_cleaner(feature_name)}/views/index.html"
    paths[:routes] = "features/#{name_cleaner(feature_name)}/routes.#{language_extension_generator(language.downcase)}"

    paths.each do |key, value|
      dirname = File.dirname(value)

      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

    end

  end

end
