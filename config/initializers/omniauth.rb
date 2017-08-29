Rails.application.config.middleware.use OmniAuth::Builder do
  opts = {
    ssl: { verify: !Rails.env.development? }
  }
  if ENV['RECHARGE_PROVIDER_URL'].present?
    opts[:site] = ENV['RECHARGE_PROVIDER_URL']
  end
  provider :recharge, ENV['RECHARGE_CLIENT_ID'], ENV['RECHARGE_CLIENT_SECRET'], client_options: opts
end
