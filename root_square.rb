#Approximate the square root of a number in RubyTry Me!
#Use Newton's method to approximate the square root of a method.
#Newton's method is to approximate z = Sqrt(x) by picking a starting point z and then repeating:
#
#z = z - (z*z - x)/(2*z)

class Newton
  def initialize(value, approximation = 0.1)
    raise ArgumentError unless value.kind_of?(Numeric)
    if value < 0
      @imaginary = true
      value = value * -1
    else
      @imaginary = false
    end
    @value = value
    @approximation = approximation
    @z = 1.0
  end

  def newton_square
    return 0 if @value == 0
    return 1 if @value == 1
    z = @z
    begin
      pz = z
      z = z - (z*z - @value)/(2*z)
    end until (pz - z).abs <= @approximation
    if @imaginary
      puts z.to_s + "i"
    else
      puts z.to_s
    end
  end
end

a = Newton.new(2253223)
a.newton_square