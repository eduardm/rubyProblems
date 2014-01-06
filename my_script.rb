class RI
  #Characters in Strings in Ruby
  #Implement a function with signature find_chars(string1, string2) that takes two strings
  #and returns a string that contains only the characters found in string1 and string two
  #in the order that they are found in string1.
  #Implement a version of order N*N and one of order N.
  def self.find_chars(str1, str2)
    result = ""
    str1.each_char do |char|
      result << char if str2.include? char
    end
    puts result
  end

  def self.swap(number, curr_number = nil)
    arr = number.to_s.chars.to_a
    len = arr.length - 1
    (len-1).downto 0 do |i|
      subarr = arr[i..len].sort
      new_number = (arr[0...i] + subarr).to_i
      if new_number > number
        return new_number
      else
        subarr = subarr[1] + subarr[0]
        new_number = (arr[0...i] + subarr).to_i
      end
      puts new_number.to_i, "--"
    end
  end

  #def self.comp(number, fix_number, sub_number)
  #  0.upto sub_number.length do |i|
  #    if (fix_number + sub_number).to_i > number
  #      retun number
  #    else
  #      0
  #  end
  #
  #end
end


class Array
  def to_i
    self.inject(0) { |r, n|
      pow = (self.length - 1 - self.index(n))
      r += n.to_i * 10 ** pow
      r
    }
  end
end
class String
  def sstr(str)
    n = self.length
    m = str.length
    0.upto n-m+1 do |i|
      if (self[i..i+m-1] == str)
        puts i
        break
      end
    end
  end

  def last
    self[-1,1]
  end

  def perm
    self.chars.to_a.permutation.map { |x| x.join.to_i }
  end
end

class Integer
  def swap
    str = self.to_s
    len = str.length - 1
    return self if len == 0
    len.downto (1) do |i|
      curr = (str[0...i-1] + str[i] + str[i-1] + str[i+1..len]).to_i
      if str[i-1] < str[i]
        #possible = str[i-1..len].perm.sort
        #final = possible[possible.index(str[i-1..len].to_i)  + 1]
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

  def next_pal
    str = self.to_s
    len = str.length
    midx = (len/2).to_i
    if len % 2 == 0
        middle = str[midx-1..midx]
        fct = 0
    else
      middle = str[midx]
      fct = 1
    end
    0.upto midx do |i|
      new_middle = ""
      idx = (middle.length / 2).to_i
      middle.each_char do |c|
        new_middle += "0" if c == "9"
        new_middle += (c.to_i + 1).to_s if c != "9"
      end
      start_idx = midx-i-idx
      end_idx = midx + i + idx + fct
      first_part = start_idx >= 0 ? str[0...start_idx] : ""
      last_part = end_idx < len ? str[end_idx..len-1] : ""
      new_pal = (first_part + new_middle + last_part).to_i
      if ( new_pal > self)
        return new_pal
      end
      middle = str[midx-i-1..midx+i+1]
    end



  end

  def to_a
    self.to_s.chars.to_a
  end
end


class ChainList < Array
  def initialize
    super
  end
end
#
#RI.find_chars "abccc", "edcc"
#x = %w[a b a b]
#
#x.each {|y| puts y.object_id}
#"abcdefgxxsxrerqfdsa".sstr("ac")

#puts RI.swap 38276

puts 15432.swap
puts 38276.swap

#a = %w[1 2 3]
#puts a.to_i

#puts "123".perm.sort

#puts "aab".sub("a","")
#puts 1991.next_pal