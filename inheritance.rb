
module X
  def method_x
    puts "X.method_x"
  end
end

lass A
  def method_x
    puts "A.method_x"
  end
  
end

class B < A
  include X
  def method_x
    puts "B.method_x"
  end

end


