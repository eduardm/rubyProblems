#A solution for http://www.spoj.com/problems/MISSING/
#Given two numbers N and K, consider the following sequence of N integers:
#
#K, K + 1, K + 2, …, K + N - 1
#
#You will be given N - 1 of those integers in any order, and you will have to find the missing number in the sequence.
#
#Input
#
#The first line of input contains two numbers separated by one space, N and K, where 1 < N <= 107 and 1 <= K <= 231-1.
#
#The second line contains N – 1 integers from the sequence specified above, with one space between each integer. The N – 1 numbers are arranged in no particular order. One of the numbers in the sequence is missing.
#
#Output
#
#Output a single line containing the missing number in the sequence.
#
#Example
#
#Input 1:
#5 4
#5 4 7 6
#
#Output 1:
#8
#Input 2:
#3 2
#4 2
#Output 2:
#3
# this solution is using xor to find the missing number. This is work on progress, is working currently only for k = 1

#def find_missing
#  n, k = gets.chomp.split(" ").map(&:to_i)
#  max = n + k - 1
#  arr = gets.chomp.split(" ").map(&:to_i)
#  a = (max % 4 == 0) ? max : (max % 4 == 1) ? max - 1 : (max % 4 == 2) ? max : 0
#  #0.upto max do |a|
#  #  puts "Trying with a: #{a}"
#  0.upto n-2 do |i|
#    a = a ^ arr[i]
#  end
#  #puts "result is: #{a}"
#  puts a
#  #end
#end

#find_missing

#def find_missing(arr, k=2)
#  n = arr.size + 1
#  max = n + k - 1
#  #arr = gets.chomp.split(" ").map(&:to_i)
#  rest = n % 4
#  a = case rest
#        when 0
#          n
#        when 1
#          k
#        when 2
#          n+1
#        when 3
#          0
#      end
#  #a = (max % 4 == 0) ? max : (max % 4 == 1) ? 1 : (max % 4 == 2) ? max+1 : 0
#  puts "max: #{max} si a: #{a} si rest: #{rest}"
#  #0.upto max do |a|
#  #  puts "Trying with a: #{a}"
#  #a = a + k-1
#  0.upto 20 do |a|
#    puts "tr: #{a}"
#    0.upto n-2 do |i|
#      a = a ^ arr[i]
#    end
#    puts "found #{a}"
#  end
#  #puts "result is: #{a}"
#  puts "found: #{a} missing in #{arr}"
##end
#end
#
##find_missing [3, 2, 7, 5, 8, 4]
##find_missing [3, 5, 4]
#find_missing [2, 6, 4, 5]
##find_missing [3, 7, 4, 2, 6]
##find_missing [4,6,7,8,5,10]  #k = 4, rest = 2 => max
##find_missing [3,6,7,8,5,9]  #k = 3, rest = 2