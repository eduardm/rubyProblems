#Problem 3.4: Given a dictionary that can tell you whether a string is
#
#a valid word or not in constant time and given a st血19 s of length 凡
#
#provide an efficient algorithm that ca口tell whether s can be reconstituted
#
#as a seque口ce of valid words. In the event that the string is valid, your
#
#algorithm should output the corresponding sequence of words

class Dictionary
  def initialize
    @dict = []
    2.upto 14 do |i|
      @dict += File.read(File.join("dict", "#{i}.txt")).split(" ")
    end
  end

  def is_valid?(word)
    @dict.include? word
  end
end

class Breaking
  def initialize(string)
    @string = string
    @dict = Dictionary.new
  end
  def break_string

  end
end

