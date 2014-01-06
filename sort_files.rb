#Merge n sorted arrays into a sorted array in O(n2)

class Merge
  def initialize(arr)
    @arr = arr
    @merger = []
    do_merge
  end

  private
  def do_merge
    while @arr.size > 1 do
      mark = @arr[0][0]
      idx = 0
      @arr.each_with_index {|a, i| mark, idx = [a[0], i] if mark > a[0]}
      @merger << @arr[idx].shift
      @arr.delete_at(idx) if @arr[idx].empty?
    end
    @merger += @arr.shift
    puts "#{@merger}"
  end

end

a = [1, 3, 12, 55, 122, 444]
b = [2, 11, 111, 333, 555, 777]
c = [7]
d = [9999, 99999, 9999999]
e = [1, 2, 3, 4, 11, 12, 13, 15, 16, 17, 22]
f = (2..100).to_a
g = (88..199).to_a

x = Merge.new([a, b, c, d, e, f, g])