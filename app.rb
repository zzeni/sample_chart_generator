require 'rubygems'
require 'sinatra'
require './config'

get "/chart" do
  @chart_url = generate_chart "data1"
  haml :chart
end

post "/chart" do
  @chart_url = generate_chart "data1", params[:type]
  haml :chart
end

get "/admin" do
  protected!
  haml :admin_panel
end

