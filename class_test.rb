def MyStruct(*keys)
  Class.new do
    attr_accessor *keys

    def initialize(hash)
      hash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end

puts "MyStruct: #{MyStruct}"
class ClassTest
  
end