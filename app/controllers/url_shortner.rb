require './app/models/url'
require './app/services/call.rb'

class UrlShortner < Sinatra::Base
    get '/' do
        erb :index
    end

    get '/:code' do
        url = Call.service(:url_resolver).new(code: params[:code]).resolve
        redirect url, 301
    end

    post '/' do
        @code = Call.service(:url_generator).new(url: params[:url]).shorten!
        erb :link
    end

end