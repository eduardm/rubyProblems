

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

puts 5 ^ 4