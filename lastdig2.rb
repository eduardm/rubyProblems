#        http://www.spoj.com/problems/LASTDIG2/
#Pappu was doing the work of his math class about three days but he is tired of make operations a lot and he should deliver his task tomorrow. His math’s teacher gives two
#numbers a and b. The problem consist in find the last digit of the potency of base a and index b. Help Pappu with his problem. You are given two integer numbers: the base a (number of digits d, such that 1<=d<=1000) and the index b (0 <= b <= 922*10^15). You
#                                     end
#have to find the last digit of a^b.
#
#                                                         Input
#The first line of input contains an integer t, the number of test cases (t <= 30). t test cases follow. For
#each test case will appear a and b separated by space.
#
#                                                         Output
#For each test case output an integer per line representing the result.
#
#Example
#Input:
#3
#3 10
#6 2
#150 53
#Output:
#9
#6
#0
#THis solution gets AC on spoj with Time = 0.11

def ld2
  b, e = gets.chomp.split(" ").map(&:to_i)
  b = b % 10
  return 1 if e == 0 || b == 1
  return 0 if b == 0
  return b if e == 1
  return (b * b) % 10 if e == 2
  return b if b == 5 || b == 6
  ld ={
      2 => [4, 8, 6, 2],
      3 => [9, 7, 1, 3],
      4 => [6, 4],
      7 => [9, 3, 1, 7],
      8 => [4, 2, 6, 8],
      9 => [1, 9]
  }
  r = ld[b]
    return r[e % r.size - 2]
end

def input
  gets.chomp.to_i.times { puts ld2 }
end

input
#
#def test
#  0.upto 1001 do |i|
#    0.upto 11 do |j|
#      r = ld2(i, j)
#      c = i**j % 10
#      if  r != c
#        puts "WRONG: #{i}, #{j} = #{r}", "Good: #{c}", "--------------"
#      end
#    end
#  end
#end
#
#test