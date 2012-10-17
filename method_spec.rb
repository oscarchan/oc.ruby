require 'rspec'

class VarArgMethodTest
  def method_var_args(*args)
    args
  end

  def method_last_var_args(arg1, *args)
    return arg1, args
  end

  def method_mid_var_args(arg1, *args, arg2)
    return arg1, args, arg2
  end
end

describe VarArgMethodTest, "variable argument method" do
  it "should splat" do
    VarArgMethodTest.new.method_var_args(1, 2, 3, 4).should == [1, 2, 3, 4]
  end

  it "should splat last" do
    VarArgMethodTest.new.method_last_var_args(1, 2, 3, 4).should == [1, [2, 3, 4]]
    arg1, args = VarArgMethodTest.new.method_last_var_args(1, 2, 3, 4)
    arg1.should == 1
    args.should == [2, 3, 4]
  end

  it "should splat mid" do
    VarArgMethodTest.new.method_last_var_args(1, 2, 3, 4).should == [1, [2, 3], 4]
    arg1, args, arg2 = VarArgMethodTest.new.method_last_var_args(1, 2, 3, 4)
    arg1.should == 1
    args.should == [2, 3]
    arg2.should == 4
  end
end

describe 



# p VarArgMethodTest::method_var_args(1, 2, 3, 4)

#describe VarArgMethodTest do
#  it "should splat arguments" do
#    p VarArgMethodTest::method_var_args(1, 2, 3, 4)
#  end
#
#end


