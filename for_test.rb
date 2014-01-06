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