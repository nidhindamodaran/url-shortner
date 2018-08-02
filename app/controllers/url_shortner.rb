require './app/models/url'

class UrlShortner < Sinatra::Base
    get '/' do
        erb :index
    end

    get '/:short_code' do
        #Redirect to original url
    end

    post '/' do
        #Save Data to Url
        #Call Serivice for shortening
    end

end