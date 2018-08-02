require './app/models/url'
require './app/services/call.rb'

class UrlShortner < Sinatra::Base
    get '/' do
        erb :index
    end

    get '/:short_code' do
        #Redirect to original url
    end

    post '/' do
        code = Call.service(:url_generator).new(url: params[:url]).shorten!
    end

    private

    # def params
    #     puts "-----------------------#{request.body.read.inspect}"
    #     body = request.body.read.to_s
    #     return {} if body.empty?
    
    #     payload = JSON.parse(body)
    #     Hash[payload.map { |(k,v)| [k.to_sym, v] }]
    # end

end