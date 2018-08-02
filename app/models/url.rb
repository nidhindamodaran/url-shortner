class Url < ActiveRecord::Base
    validates_presence_of   :url, :message => "You must specify a URL."
end