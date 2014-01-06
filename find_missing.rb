n = 10;
a = [5,3,6,2,1,10,9,7,4]

xor = (n % 4 == 0) ? n : (n % 4 == 1) ? 1 : (n % 4 == 2) ? n + 1 : 0;
puts xor
0.upto n-2 do |i|
    xor = xor ^ a[i]
end
puts xor