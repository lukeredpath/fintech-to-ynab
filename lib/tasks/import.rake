namespace :import do
  desc 'Imports transactions from your Monzo account'
  task :monzo do
    # Configure these environment variables on your Heroku instance
    monzo_access_token = ENV.fetch('MONZO_ACCESS_TOKEN')
    monzo_account_id = ENV.fetch('MONZO_ACCOUNT_ID')
    ynab_account_id = ENV.fetch('YNAB_MONZO_ACCOUNT_ID')

    begin
      Import::Monzo.new(monzo_access_token, monzo_account_id, ynab_account_id).import
    rescue StandardError => e
      puts "Monzo import failed (#{e}). Check your environment variables are correct."
      exit 1
    end
  end
end
