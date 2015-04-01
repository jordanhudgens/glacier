module AssetGenerator
  def create_assets
    FileUtils.cp_r 'lib/assets/.', 'assets/'
    FileUtils.cp_r 'lib/launch/.', 'launch/'
  end
end