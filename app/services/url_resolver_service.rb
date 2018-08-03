class UrlResolverService
    attr_accessor :code, :url

    def initialize(code:)
        @code = code
    end

    def resolve
        link =   Url.find_by_code(code)
        link.increment!(:visits) if link.present?

        link.try(:url)
    end

    def fetch_url_details
        link =   Url.find_by_code(code)

        link
    end
end