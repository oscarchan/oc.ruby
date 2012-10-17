require 'open-uri'
require 'nokogiri'

class Job
  attr_accessor :title, :location, :uri

  def initialize(title, location, uri)
    self.title = title;
    self.location = location;
    self.uri = uri
  end
end


doc = Nokogiri::HTML(open("http://sfbay.craigslist.org/search/sof?query=software&srchType=A"))

jobs_by_location = Hash.new { |hash, key| hash[key]=Array.new } 

jobs = doc.css('p.row').map do |row|
  job_node = row.css('a').first
  title = job_node.text if job_node
  uri = job_node['href'] if job_node

  location_node = row.css('span.itempn > font').first
  location = location_node.text.strip if location_node
  job = Job.new(title, location, uri)

  list = jobs_by_location[location]
  list << job
end


jobs_by_location.each { |k, v| puts "#{k} has #{v.size} job(s)" }; nil
