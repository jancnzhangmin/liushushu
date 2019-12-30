# Precompile SmartAdmin assets
Rails.application.config.assets.precompile +=
  Rails.configuration.sa_asset_filetypes.collect do |entry|
    Rails.configuration.sa_assets_prefix + entry
  end
