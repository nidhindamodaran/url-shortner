require 'sinatra'

class UrlShortner < Sinatra::Base
    set :views, File.expand_path('./app/views')
end

Dir[File.expand_path('app/controllers/**/*.rb'), __FILE__].each {|file| require file}
