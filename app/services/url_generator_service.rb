class UrlGeneratorService
    attr_accessor :url
    CHARSET = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a

    def initialize(url:)
        @url = url
    end

    def shorten!
        parse_url!

        shortened_url =   Url.find_or_initialize_by(url: url)
        
        if shortened_url.new_record?
            shortened_url.code = generate_code
            shortened_url.save
        end

        shortened_url.code
    end

    private

    def parse_url!
        url = url.to_s.strip
        if url !~ url_with_protocol? && url[0] != '/'
          url = "/#{url}"
        end
        URI.parse(url).normalize.to_s
    end

    def url_with_protocol?
        Regexp.new('\Ahttp:\/\/|\Ahttps:\/\/', Regexp::IGNORECASE)
    end

    def generate_code
        loop do
            code = (0..6).map { CHARSET[rand(CHARSET.size)] }.join
      
            return code unless Url.exists?(:code => code)
        end
    end

end