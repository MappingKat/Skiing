CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],            # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],        # required
      :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'wdi5-project3-weare'                    # required
    config.fog_public     = true                               # optional, defaults to true
  end
end
