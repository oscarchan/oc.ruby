require 'net/http'
require 'uri'
require 'nokogiri'
require 'csv'

def fetch(uri_str, limit = 10)
  ua = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.65 Safari/537.36'
  # You should choose better exception.
  raise ArgumentError, 'HTTP redirect too deep' if limit == 0
  uri_str = uri_str + '/' unless uri_str.end_with? '/'
  url = URI.parse(uri_str)
  req = Net::HTTP::Get.new(url.path, { 'User-Agent' => ua })
  req.use_ssl if url.scheme = 'https'
  response = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
  case response
  when Net::HTTPSuccess     then response
  when Net::HTTPRedirection then fetch(response['location'], limit - 1)
  else
    response.error!
  end
end

def match_canonical(url, canonical)
  response = fetch(url)
  Nokogiri::HTML(response.body)
end

url = 'http://www.surveymonkey.com'
canonical = 'https://www.surveymonkey.com'
doc = match_canonical(url, canonical)

print doc
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
