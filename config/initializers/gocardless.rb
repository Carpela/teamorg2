GoCardless.account_details = {
  :app_id      => ENV['GC_APP_ID'],
  :app_secret  => ENV['GC_APP_SECRET'],
  :token       => ENV['GC_MERCHANT_ACCESS_TOKEN'],
  :merchant_id => ENV['GC_MERCHANT_ID']
}

if Rails.env.development?
  GoCardless.environment = :sandbox
end