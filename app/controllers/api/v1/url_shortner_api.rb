# require './app/models/url'
# require './app/services/call.rb'
# require 'json'
#
# class UrlShortner < Sinatra::Base
#   get '/api/:code' do
#     details = Call.service(:url_resolver).new(code: params[:code]).fetch_url_details
#
#     json details, { each_serializer: LinkSerializer }
#   end
#
# end