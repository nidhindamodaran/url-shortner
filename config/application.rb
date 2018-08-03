require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'

class UrlShortner < Sinatra::Base

    #Registering Active Record
    register Sinatra::ActiveRecordExtension
    register Sinatra::Contrib

    enable :logging
    
    set :views, File.expand_path('./app/views')
    set :root, File.expand_path('./app')
end

Dir[File.expand_path('app/controllers/**/*.rb'), __FILE__].each {|file| require file}
