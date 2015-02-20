GoCardless.account_details = {
  :app_id      => 'TEAMORG',
  :app_secret  => ENV['GC_APP_SECRET'],
  :token       => ENV['GC_MERCHANT_ACCESS_TOKEN'],
  :merchant_id => ENV['GC_MERCHANT_ID']
}

GoCardless.environment = :sandbox