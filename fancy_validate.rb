#This problem is found at: http://thereq.com/q/300/ruby-software-interview-question/implement-accessors-with-validation
#Implement Accessors With Validation in Ruby
#
#Implement a fancier version of attr_accessor that includes validation. Complete the attr_validated code below so that the unit tests pass.
#
#require 'test/unit'
#
#class Dog
#
#    def self.attr_validated(method_name, &validation)
#        # Complete this method so that the unit tests pass
#    end
#
#    attr_validated :num_legs do |v|
#        v <= 4
#    end
#
#
#end
#
#class TestDog < Test::Unit::TestCase
#
#    def test_good_value
#        dog = Dog.new
#        dog.num_legs = 3
#
#        assert_equal 3, dog.num_legs
#    end
#
#    def test_nil_value
#        dog = Dog.new
#        assert_raises ArgumentError do
#            dog.num_legs = nil
#        end
#    end
#
#    def test_illegal_value
#        dog = Dog.new
#        assert_raises ArgumentError do
#            dog.num_legs = 5
#        end
#    end
#
#end


require 'test/unit'

class Dog


  def self.attr_validated(method_name, &validation)
    define_method(method_name) do
      instance_variable_get("@#{method_name.to_s}")
    end

    define_method("#{method_name.to_s}=") do |method_name_value|
      instance_variable_set("@#{method_name.to_s}", method_name_value)
      raise ArgumentError if method_name_value == nil
      raise ArgumentError unless yield(method_name_value)
    end
  end


  attr_validated :num_legs do |v|
    v <= 4
  end


end

class TestDog < Test::Unit::TestCase

  def test_good_value
    dog = Dog.new
    dog.num_legs = 3

    assert_equal 3, dog.num_legs
  end

  def test_nil_value
    dog = Dog.new
    assert_raises ArgumentError do
      dog.num_legs = nil
    end
  end

  def test_illegal_value
    dog = Dog.new
    assert_raises ArgumentError do
      dog.num_legs = 5
    end
  end

end