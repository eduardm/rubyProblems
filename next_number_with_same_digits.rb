#Problem found at http://thereq.com/q/151/ruby-software-interview-question/next-highest-number-with-same-digits
#Next highest number with same digits in Ruby
#Given any integer, efficiently find the next highest integer that uses the same digits.
#
#For example if the number is 15432, you should return 21345.

#We will define a swap method on the Fixnum class
class Fixnum
  def swap
    str = self.to_s
    len = str.length - 1
    return self if len == 0
    len.downto (1) do |i|
      curr = (str[0...i-1] + str[i] + str[i-1] + str[i+1..len]).to_i
      if str[i-1] < str[i]
        substr = str[i-1..len]
        mark = str[i-1].to_i
        first = 10
        rest = []
        substr.each_char do |c|
          first = c.to_i if (c.to_i < first && c.to_i > mark)
          ins = false
          rest.each_with_index do |n, j|
            if (c.to_i > rest[j-1] && c.to_i <= n)
              rest.insert(j, c.to_i)
              ins = true
            end
          end
          rest << c.to_i unless ins
        end
        rest.delete_at(rest.index(first))
        return (str[0...i-1] + first.to_s + rest.join).to_i
      end
    end
  end
end

puts 15432.swap
puts 38276.swap