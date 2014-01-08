#http://thereq.com/q/99/ruby-software-interview-question/memoization-techniques
#Memoization techniques in Ruby
#
#Suppose you have a class that performs several expensive calculations. However, during the lifetime of an object, the result of the expensive calculation won't change. Therefore, you wish to ensure that each calculation is performed only once, and that result is cached. A simple technique for this would be as follows:
#
#class Calculator
#    def expensive_calc_one
#        return @result1 unless @result1.nil?
#       @result1 = # Do very expensive calculation.
#    end
#
#   def expensive_calc_two
#        return @result2 unless @result2.nil?
#       @result2 = # Do very expensive calculation.
#    end
#end
#If this class contained many such expensive calculations, this memoization technique would become repetitive. Can you come up with a framework that reduces this repetition by allowing one to simply mark a method as memoized and no longer have to worry about manually handling the caching?
#
#Bonus points: There is a flaw in the simple technique. Under one set of circumstances the caching will fail and repeated calls to expensive_calc_one will result in the expensive calculation being executed again and gain. When would this occur?

class Calculator


  def initialize
    @cache = {}
  end

  def eco
    return @result1 unless @result1.nil?
    @result1 = expensive
  end

  def ect
    return @result2 unless @result2.nil?
    @result2 = expensive
  end

  def self.attr_memo(*method_names)
    method_names.each do |method_name|
      old_method = instance_method(method_name)
      define_method method_name do
        @cache[method_name] = old_method.bind(self).call if !@cache.has_key?(method_name)
        @cache[method_name]
      end
    end
  end

  attr_memo :ect, :eco

  private
  def expensive
    a = 1 + 2
    puts "executed"
    a
  end
end


a = Calculator.new
puts a.eco
puts a.ect
puts a.ect
puts a.eco
puts a.eco
puts a.eco
puts a.ect
