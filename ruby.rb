# print method with pattern
Array.methods.each { |m| puts "#{m}" if m.to_s =~ /^to/}; nil

# active_record does not have accessor in methods
[].methods.find_all { |m| m.to_s =~ /first_name/ }
