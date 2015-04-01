require 'fileutils'
require './lib/ruby/ruby_generator.rb'
require './lib/features/feature_generator.rb'
require './lib/assets/asset_generator.rb'
require './lib/common/app_setup.rb'
require './lib/common/app_generator.rb'
require './lib/common/asset_generator.rb'

class Runner
  include RubyGenerator
  include FeatureGenerator
  include AssetGenerator
  include AppSetup
  include AppGenerator
  include AssetGenerator

  def initialize
    app_questions
    create_assets
  end

end

app = Runner.new

app.feature_generator("my cool feature 2222", "ruby")