require './app/models/url'
require './app/services/call.rb'

require 'json'

class UrlShortner < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/:code' do
    url = Call.service(:url_resolver).new(code: params[:code]).resolve
    return 404 unless url

    redirect url, 301
  end

  post '/' do
    @link = Call.service(:url_generator).new(url: params[:url]).shorten!
    erb :link
  end

  get '/api/:code' do
    url = Call.service(:url_resolver).new(code: params[:code]).fetch_url_details
    return 404 unless url

    json url.details_json
  end

  not_found do
    status 404
    erb :not_found
  end

end