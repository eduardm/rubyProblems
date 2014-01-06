#The Nth Smallest Element in a Binary Tree in RubyTry Me!
#Write function that takes a binary tree and efficiently returns the Nth smallest element.
#
#For example, if N=4, and the tree looks like:
#
#    3
#   / \
#  2   5
# /   / \
#1   4   6
#The function should return 4.

class ANode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    raise ArgumentError unless value.kind_of?(Numeric)
    @value = value
    @left = nil
    @right = nil
  end

  def children
    [@left, @right]
  end

  def to_s
    "#{@value}: left: #{self.left ? self.left.value : "nil"} | right: #{self.right ? self.right.value : "nil"}"
  end
end

class BTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def add(node, leaf = @root)
    if node.value <= leaf.value
      if leaf.left
        add(node, leaf.left)
      else
        leaf.left = node
      end
    else
      if leaf.right
        add(node, leaf.right)
      else
        leaf.right = node
      end
    end
  end

  def show
    print @root.value
    print "\n"
    pr(@root.children.compact)
  end

  def find_small(nth)
    @nth ||= []
    find_n(@root) if @nth.empty?
    puts @nth[nth].value
  end

  private
  def find_n(node)
    return unless node
    @nth << node
    find_n(node.left)
    find_n(node.right)
  end

  def pr(node_arr)
    return if node_arr.empty?
    next_node_arr = []
    node_arr.each do |n|
      print n.value, " "
      print "\n" if n == node_arr.last
      next_node_arr << n.children
    end
    pr(next_node_arr.flatten.compact)
  end


end

class AQueue < Array
  def initialize
    super
  end

  def pull
    self.delete_at(0)
  end
end

def add_data
  data = [3, 2, 1, 5, 4, 6]
  node = ANode.new(data.delete_at 0)
  tree = BTree.new(node)
  data.each do |n|
    node = ANode.new(n)
    tree.add(node)
  end
  return tree
end

t = add_data
t.show
t.find_small(4)