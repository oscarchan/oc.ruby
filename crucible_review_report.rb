require 'net/http'
require 'open-uri'

class CrucibleReviewReport
  # To change this template use File | Settings | File Templates.


end

#result = Net::HTTP.get("http://crucible.payments.zynga.com/crucible/cru/CR-733/comments.txt")


#doc = Nokogiri::HTML(open('http://crucible.payments.zynga.com/crucible/cru/CR-733/comments.txt'))

lines = IO.readlines("cr-733.txt")

reviewers = []

lines.reverse_each {
  |line|
  break if line =~ /Reviewers/
  line = line.strip

  reviewers << line if ! line.empty? && line !~ /\*/
}

puts reviewers


