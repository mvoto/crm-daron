CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['S3_KEY'],
    aws_secret_access_key: ENV['S3_SECRET'],
    region:                ENV['S3_REGION'] || 'sa-east-1'
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads" # To let it work on heroku
  config.fog_directory  = ENV['S3_BUCKET'] || 'crm-daron-staging'
  config.fog_public     = false
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
end
