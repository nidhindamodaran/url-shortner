require_relative 'url_generator_service.rb'
class Call
    class << self
        def service service
          # Resolve service
          case service
          when :url_generator               then UrlGeneratorService
          when :resolve_url                 then UrlResolverService
    
          else                              raise ArgumentError, "Service not implemented"
          end
        end
    
        alias_method :[], :service
      end
end