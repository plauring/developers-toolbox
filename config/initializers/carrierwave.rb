CarrierWave.configure do |config|
  if !Rails.env.test?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key']
    }                  # To let CarrierWave work on heroku
    config.fog_directory = ENV['S3_BUCKET']
  end
end
