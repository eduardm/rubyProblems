#Problem found at: http ://thereq.com/q/151/ruby-software-interview-question/next-highest-number-with-same-digits
#And also here: http://www.spoj.com/problems/PALIN/
#A positive integer is called a palindrome if its representation in the decimal system is the same when read from left to right and from right to left. For a given positive
#integer K of not more than 1000000 digits, write the value of the smallest palindrome larger than K to output. Numbers are always displayed without leading zeros.
#
#Input
#
#The first line contains integer t, the number of test cases. Integers K are given in the next t lines.
#
#Output
#
#For each K, output the smallest palindrome larger than K.
#
#Example
#
#Input:
#2
#808
#2133
#
#Output:
#818
#2222

def next_pal
  str = gets.chomp
  len = str.length
  midx = (len/2).to_i
  if len == 1
    return "11" if str == "9"
    return str.next
  end
  if len % 2 == 0
    first = str[0...midx]
    last = str[midx..len-1]
    last_from_first = first.reverse
    if last_from_first > last
      return first + last_from_first
    else
      nfirst = first.next
      nlast = nfirst.reverse
      if nfirst.length > first.length
        nlast.slice!(0)
        return nfirst + nlast
      else
        return nfirst + nlast
      end

    end
  else
    first = str[0...midx]
    middle =  str[midx]
    first_with_middle = first + middle
    last = str[midx..len-1]
    last_from_first = first.reverse
    if last_from_first > last
      return first_with_middle + last_from_first
    else
      if middle == "9"
        middle = "0"
        nfirst = first.next
        if nfirst.length > first.length
          return nfirst + nfirst.reverse
        else
          return nfirst + middle + nfirst.reverse
        end
      else
        return first + middle.next + last_from_first
      end
    end
  end
end

class String
  def last
    self[self.length-1]
  end
end


def input
  gets.chomp.to_i.times { puts next_pal }
end

input

