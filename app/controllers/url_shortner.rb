require './app/models/url'

class UrlShortner < Sinatra::Base
    get '/' do
        @urls = Url.all
        erb :index
    end
end