#SPOJ Problem Set (classical)
#
#3442. The last digit
#
#Problem code: LASTDIG
#
#
#
#
#Nestor was doing the work of his math class about three days but he is tired of make operations a lot and he should deliver his task tomorrow. His math’s teacher gives two numbers a and b. The problem consist in find the last digit of the potency of base a and index b. Help Nestor with his problem. You are given two integer numbers: the base a (0 <= a <= 20) and the index b (0 <= b <= 2,147,483,000), a and b both are not 0. You have to find the last digit of a^b.
#
#Input
#
#The first line of input contains an integer t, the number of test cases (t <= 30). t test cases follow. For each test case will appear a and b separated by space.
#
#Output
#
#For each test case output an integer per line representing the result.
#
#Example
#
#Input:
#2
#3 10
#6 2
#
#Output:
#9
#6
# this solution gets AC on Spoj with TIME=0.13 and MEM=7.3. For a faster solution, please check lastdig2.rb
class LD
  def initialize
    @ld={}
    2.upto 9 do |j|
      i=2
      @ld[j]=[]
      while @ld[j].size == @ld[j].uniq.size
        @ld[j] << (j ** i) % 10
        i+=1
      end
    end
    #puts "{"
    @ld.each do |k,v|
      v = [1,2] + v
    end
    #puts "}"
  end

  def ld(e, b)
    r = @ld[b].uniq
    r[(e % r.size) -2]
  end
end

def cld()
  b, e = gets.chomp.split(" ").map(&:to_i)
  b = b % 10
  return 1 if e == 0 || b == 1
  return 0 if b == 0
  return b if e == 1
  return (b * b) % 10 if e == 2
  return b if b == 5 || b == 6
  ld = LD.new
  return ld.ld(e, b)
end

#
def input
  gets.chomp.to_i.times { puts cld }
end

input

#def test
#  0.upto 1001 do |i|
#    0.upto 11 do |j|
#      r = cld(i, j)
#      c = i**j % 10
#      if  r != c
#        puts "WRONG: #{i}, #{j} = #{r}", "Good: #{c}", "--------------"
#      end
#    end
#  end
#end
#
#test