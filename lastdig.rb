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
    puts "{"
    @ld.each do |k,v|
      v = [1,2] + v
      puts "#{k} => #{v[0...v.size-1]},"
    end
    puts "}"
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