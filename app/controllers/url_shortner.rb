class UrlShortner < Sinatra::Base
    get '/' do
        erb :index
    end
end