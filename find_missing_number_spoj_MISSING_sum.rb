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
# this solution is AC on SPOJ with TIME = 0.69 and MEM=25Mb

def find_missing
  n,k = gets.chomp.split(" ").map(&:to_i)
  n = n + k - 1
  arr = gets.chomp.split(" ").map(&:to_i)
  sum_k_n = (n * (n + 1) / 2) - (k * (k-1) / 2)
  sum_of_arr = arr.inject(&:+)
  puts sum_k_n - sum_of_arr
end
find_missing