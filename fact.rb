
def trail_zero
  n = gets.chomp.to_i
  r = 0
  while n > 1
    r += n/5
    n /= 5
  end
  return r
end

def input
  gets.chomp.to_i.times { puts trail_zero }
end

input
