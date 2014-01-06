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