require 'localeapp/rails'

Localeapp.configure do |config|
  config.api_key = 'CQIW6BXjt26clGkFRJkldBy1jdm1HGGO4p6fT6e29FmHO9l21H'
  
# allow localeapp to check for new translations in production
config.polling_environments << :production

# the number of seconds to wait between checking for new translations
# enter `0` to check on every request 
config.poll_interval = 0

# when new translations have been downloaded, reload I18n
config.reloading_environments << :production

# send missing translations to Locale in production
config.sending_environments << :production
end



#The last step is to have heroku pull the latest translations when it
#starts or restarts the dyno. At the end of config/initializers/localeapp.rb add:

if Rails.env.production?
  Localeapp::CLI::Pull.new.execute
end