#This is a simplification of http://www.spoj.com/problems/MISSING/
#The original problem is:
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

#This simplification presents 2 solutions for the case when k = 1 and only N is considered

#First solution implies of summing all numbers to n with the formula n(n+1)/2 and substract the sum of the given array. Time is O(n)
def find_missing_by_sum(arr)
  n = arr.size + 1
  sum_of_all_numbers_up_to_n = n * (n + 1) / 2
  sum_of_all_elements_from_array = arr.inject(&:+)
  puts "Missing number is: #{sum_of_all_numbers_up_to_n - sum_of_all_elements_from_array}"
end
find_missing_by_sum [3,1,4]
find_missing_by_sum [3,2,7,5,1,4]

#second solution is based on the XoR. Any number XoR with itself is 0
def find_missing_by_xor(arr)
  n = arr.size + 1
  a = (n % 4 == 0) ? n : (n % 4 == 1) ? 1 : (n % 4 == 2) ? n + 1 : 0
  0.upto n-2 do |i|
      a = a ^ arr[i]
  end
  puts "Missing number is: #{a}"
end
find_missing_by_xor [3,1,4]
find_missing_by_xor [3,2,7,5,1,4]