require 'sequel'
#require 'sequel/extensions/pagination'
#require 'lib/chart_gen.rb'

# Plugins.
Dir['./plugins/*.rb'].each { |plugin| require plugin }

# Sinatra configurations.
configure do
  enable :sessions
end

# Application helpers.
helpers do
  require './helpers'
end

# Application global constants
APP_NAME = "Simple Chart Generator"
APP_AUTHOR = "emanolova@gmail.com"
APP_ADMIN_USERNAME = "zeni"
APP_ADMIN_PASSWORD = "bla"

