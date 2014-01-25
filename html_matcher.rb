require 'open-uri'
require 'nokogiri'
require 'csv'

# Allow open-uri to follow unsafe redirects (i.e. https to http).
# Relevant issue:
# http://redmine.ruby-lang.org/issues/3719
# Source here:
# https://github.com/ruby/ruby/blob/trunk/lib/open-uri.rb
# Allow open-uri to follow unsafe redirects (i.e. https to http).
# Relevant issue:
# http://redmine.ruby-lang.org/issues/3719
# Source here:
# https://github.com/ruby/ruby/blob/trunk/lib/open-uri.rb

module OpenURI
  class <<self
    alias_method :open_uri_original, :open_uri
    alias_method :redirectable_cautious?, :redirectable?
 
    def redirectable_baller? uri1, uri2
      valid = /\A(?:https?|ftp)\z/i
      valid =~ uri1.scheme.downcase && valid =~ uri2.scheme
    end
  end
 
  # The original open_uri takes *args but then doesn't do anything with them.
  # Assume we can only handle a hash.
  def self.open_uri name, options = {}
    value = options.delete :allow_unsafe_redirects
 
    if value
      class <<self
        remove_method :redirectable?
        alias_method :redirectable?, :redirectable_baller?
      end
    else
      class <<self
        remove_method :redirectable?
        alias_method :redirectable?, :redirectable_cautious?
      end
    end
 
    self.open_uri_original name, options
  end
end

def match_canonical(url, canonical)
  Nokogiri::HTML(open(url))
  
end

url = 'http://www.surveymonkey.com'
canonical = 'https://www.surveymonkey.com'
match_canonical(url, canonical)

#CSV.foreach("canonical.csv" ) &block

#end





# url = URI.parse('http://www.vehix.com/') # Make sure you put the trailing slash on!

# found = false
# until found
#   host, port = url.host, url.port if url.host && url.port
#   req = Net::HTTP::Get.new(url.path)
#   res = Net::HTTP.start(host, port) {|http|  http.request(req) }

#   res.header['location'] ? url = URI.parse(res.header['location']) : found = true
# end

# puts res.body
