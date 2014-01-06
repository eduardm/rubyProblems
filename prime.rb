class Prime
  def initialize
    @number = 1000000000
    @primes = [2]
    @max = Math.sqrt(@number).to_i
    populate_primes
  end

  def calculate_primes
    mnumber, number = gets.chomp.split(" ").map(&:to_i)
    result = []
    notprime = []
    all = Array.new(number-mnumber+1) {|i| i + mnumber}

    cap = Math.sqrt(number) + 1
    @primes.each do |p|
      if p >= cap
        break
      end

      if p >= mnumber
        start = p*2
      else
        start = mnumber + ((p - mnumber % p)%p)
      end
      start.step(number,p) do |j|
        notprime << j
        j += p
      end
    end
    return all - notprime - [1]
  end

  private
  def populate_primes
    3.step @max, 2 do |i|
      cap = Math.sqrt(i) + 1
      flag = true
      @primes.each do |prime|
        break if prime > cap
        if (i % prime) == 0
          flag = false
          break
        end
      end
      @primes << i if flag
    end
  end
end


def input
  prime = Prime.new
  r = []
  gets.chomp.to_i.times { r << prime.calculate_primes }
  r.each { |x| puts x, "\n" }
end

input
