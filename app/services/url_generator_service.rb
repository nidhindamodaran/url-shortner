class UrlGeneratorService
  attr_accessor :url
  CHARSET = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a

  def initialize(url:)
    @url = url
  end

  def shorten!
    parse_url! if url.present?

    shortened_url = Url.find_or_initialize_by(url: url)

    if shortened_url.new_record?
      shortened_url.code = generate_code
      shortened_url.save
    end

    shortened_url
  end

  private

  def generate_code
    loop do
      code = (0..6).map { CHARSET[rand(CHARSET.size)] }.join

      return code unless Url.exists?(:code => code)
    end
  end

  def parse_url!
    # normalizing url to start with a protocol

    url = @url.to_s.strip
    if url !~ has_protocol? && url[0] != '/'
      url = "http://#{url}"
    end
    @url = url
  end

  def has_protocol?
    Regexp.new('\Ahttp:\/\/|\Ahttps:\/\/', Regexp::IGNORECASE)
  end

end