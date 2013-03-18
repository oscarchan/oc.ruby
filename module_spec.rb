require 'rspec'
require 'set'


describe "module T1_A" do
  module T1_A
    @@included_modules = Set.new

    def self.included_modules
      @@included_modules
    end

    def self.included(mod)
      puts "#{self} included in #{mod}"
      @@included_modules.add(mod)
    end
  end

  context "when include in module T1_B" do
    it "should call T1_A.include()" do
      lambda {
        module T1_B
          include Math
        end
      }.should change(T1_A, :included_modules)
    end
  end

  context "when not included in module T1_C" do
    it "should not call T1_A.include()" do

      lambda {
        module T1_C
          include T1_A
        end
      }.should_not change(T1_A, :included_modules)

    end
  end

end




