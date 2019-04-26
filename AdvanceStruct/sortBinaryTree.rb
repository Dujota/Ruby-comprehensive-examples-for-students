require 'gviz'

class Tree
  attr_accessor :left, :right, :data

  def initialize(x=nil)
    @left = nil
	@right =nil
	@data = x
  end
  def insert(x)
	if @data == nil
	  @data = x
	elsif x <= @data
	  if @left == nil
		@left = Tree.new x
	  else
		@left.insert x
	  end
	else
	  if @right == nil
		@right = Tree.new x
	  else
		@right.insert x
	  end
	end
  end
  def inorder()
    @left.inorder {|y| yield y} if @left != nil
	yield @data
	@right.inorder {|y| yield y} if @right != nil
  end
  def preorder()
    yield @data
	@left.preorder {|y| yield y} if @left != nil
	@right.preorder {|y| yield y} if @right != nil
  end
  def postorder()
    @left.postorder {|y| yield y} if @left != nil
	@right.postorder {|y| yield y} if @right != nil
	yield @data
  end
  def search(x)
    if self.data == x
	  return self
	elsif x < self.data
	  return left ? left.search(x) : nil
	else
	  return right ? right.search(x) : nil
	end
  end
  def to_s
    str = "["
	str << left.to_s << ", " if left
	str << data.inspect
	str << ", " << right.to_s if right
	str << "]"
  end
  def to_a
    array = []
	array << left.to_a if left
	array << data
	array << right.to_a if right
	array
  end
  def traverse()
    list = []
	yield @data
	list << @left if @left != nil
	list << @right if @right != nil
	loop do
	  break if list.empty?
	  node = list.shift
	  yield node.data
	  list << node.left if node.left != nil
	  list << node.right if node.right != nil
	end
  end
  def make_graph(filename="treeGraph")
    @@routes = []
    make_gr(self)

    gv = Gviz.new
    gv.graph do 
      @@routes.each do |x,y|
        route  x.to_s.to_sym => y.to_s.to_sym
      end
    end
    gv.save(filename.to_sym, :png)
  end
  def make_gr(node)
    if node.left != nil
      @@routes << [node.data, node.left.data]
	    #print "l-",@routes, "\n"
	    make_gr(node.left)
    end
    if node.right != nil
	    @@routes << [node.data, node.right.data]
	    #print "r-",@routes, "\n"
	    make_gr(node.right)
    end
  end
end
