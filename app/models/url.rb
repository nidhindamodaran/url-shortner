class Url < ActiveRecord::Base
  validates :url, presence: true
  after_validation :parse_url

  def parse_url
    # normalizing url to start with a protocol

    url = self.url.to_s.strip
    if url !~ has_protocol? && url[0] != '/'
      url = "http://#{url}"
    end
    self.url = URI.parse(url).normalize.to_s
  end

  def has_protocol?
    Regexp.new('\Ahttp:\/\/|\Ahttps:\/\/', Regexp::IGNORECASE)
  end
end