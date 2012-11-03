OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, CONFIG[:FACEBOOK_APP_ID], CONFIG[:FACBOOK_SECRET]
  provider :twitter, CONFIG[:TWITTER_KEY], CONFIG[:TWITTER_SECRET]
  provider :fiveHundredPx, CONFIG[:FIVEPX_KEY], CONFIG[:FIVEPX_SECRET] 
end
