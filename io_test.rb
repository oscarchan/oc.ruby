
puts <<END
  s = IO.read('sample.csv')
END
s = IO.read('sample.csv')
puts "class=#{s.class}"


puts <<END
  s = File.open(filename, 'rb') { |f| f.read }
END
s2 = File.open('sample.csv', 'rb') { |f| f.read }

puts "output equals == #{ s == s2 }"
