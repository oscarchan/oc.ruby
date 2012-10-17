require 'set'




module OC
  # find methods with optionally a pattern
  def self.find_methods(mod_name, pattern = //)
    mod_name.methods.sort.grep(/const/).each { |m| mod_name.method(m) }
  end

  // figure out the
  def self.module_of(object)
    self.get_methods(methods).each { |m| m.owner}.reduce(Set.new, :<<)
  end

  def self.get_methods(object)
    if object.is_a? Class
      object.instance_methods
    else
      object.methods;
    end
  end

  # find definer class of the method
  def self.find_method_definer(object, method)
    self.get_class(object).find {|c| c.instance_methods(false).include? method};
  end

  def self.get_class(object)
    if object.is_a? Class
      object.class
    else
      object
    end
  end

  # return a graph of inheritance tree
  # Array of ancestor class and included module at each level
  # Note: puts self.ancestor_graph(Integer)
  # Object
  #
  # Integer
  def self.ancestor_graph(object)
    clazz = self.get_class(object)

    graph = []

    clazz.ancestors.reverse.reduce() do |hash, c|
      puts "--> #{c}"
      c.instance_methods.reduce(hash) { |hash, method| puts "method: #{method}"; hash[method] = c if hash.key? method; hash }

    end
      inheritance_tree.


    
    ancestors.each do /c/
      family_tree[c] = c.ancestors;
    end


  end
  
  def self.each_puts

  end

  def self env
    ENV.each { |arg| p arg }
    ENV.keys
  end
end
