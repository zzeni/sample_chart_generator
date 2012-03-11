require 'rubygems'
require 'sinatra'
require 'sinatra/basic_auth'
require './config'

set :layout_engine => :haml

authorize "Admin" do |username, password|
  username == APP_ADMIN_USERNAME && password == APP_ADMIN_PASSWORD
end

get "/chart" do
  @chart_url = generate_chart "data1"
  haml :chart
end

# Set protected routes
protect "Admin" do
  get "/admin" do
    haml :admin_panel
  end
end

