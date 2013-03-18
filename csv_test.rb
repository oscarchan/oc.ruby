require 'csv'

puts "RUBY_VERSION=#{RUBY_VERSION}"

puts <<END
  CSV.foreach("sample.csv" ) &block
  - returns Array in &block
END
CSV.foreach("sample.csv" ) do |row|
  puts "type=#{row.class}; size=#{row.size}; data=#{row.join(',')}"
end


puts <<END
  CSV.foreach("sample.csv", :headers => :first_row ) &block
  - return CSV::Row in &block
END

CSV.foreach("sample.csv", :headers => :first_row ) do |row|
  print "type=#{row.class}; size=#{row.size}; data="
  row.each do |header, field|
    print "#{header}:#{field}, "
  end
  puts ""
end

puts <<END
  array = CSV.read("sample.csv")
END

array = CSV.read("sample.csv")
puts "array=#{array.class}"

puts <<END
  csvtable = CSV.read("sample.csv", :headers => :first_row )
END

csvtable =  CSV.read("sample.csv", :headers => :first_row )
puts "csvtable =#{csvtable.class}"

puts <<END
  csvtable = CSV.parse(IO.read("sample.csv"), :headers => :first_row )
  puts "csvtable =#{csvtable.class}"

END

csvtable = CSV.parse(IO.read("sample.csv"), :headers => :first_row )
puts "csvtable =#{csvtable.class}"

puts <<END
  CSV.new
END

#File.open("sample.csv", "r")
