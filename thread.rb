
names = [5, 4, 3, 2, 1]

output = []
threads = []
for name in names
  threads << Thread.new(name) do |thread_name|
    output << "thread #{thread_name}:#{name} started"
    sleep thread_name.to_i
    output << "thread #{thread_name}:#{name} ended"
  end
end

puts output
