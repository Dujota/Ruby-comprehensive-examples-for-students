require 'gviz'

class Tree
  attr_accessor :left, :right, :data
  @@routes = []

  def initialize(x=nil)
    @left = nil
	@right =nil
	@data = x
  end
  def insert(x)
    list =[]
	if @data == nil
		@data = x
	elsif @left == nil
	  @left = Tree.new(x)
	elsif @right == nil
	  @right = Tree.new(x)
	else
	  list << @left
	  list << @right
	  loop do
	    node = list.shift
		if node.left == nil
	      node.insert(x)
		  break
		else
		  list << node.left
		end
		if node.right == nil
		  node.insert(x)
		  break
		else
		  list << node.right
		end
	  end
    end
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

  def make_graph(node)
	  if node.left != nil
		@@routes << [node.data, node.left.data]
		p @@routes
		make_graph(node.left)
	  end
	  if node.right != nil
	    #route @data => node.right.data
		p @@routes
		make_graph(node.right)
	  end
  end
  def read_routes
  	@@routes
  end
end

tree = Tree.new
items = [1,2,3,4,5,6,7]
items.each {|x| tree.insert(x)}
#items = "abcdef" 
#(0...items.length).each {|x| tree.insert(items[x])}
tree.traverse {|x| print "#{x} "}
puts

tree.make_graph(tree)

routes = tree.read_routes
p routes

gv = Gviz.new
gv.graph do 
  routes.each do |x,y|
    route  x.to_s.to_sym => y.to_s.to_sym
  end
end
gv.save(:treegr, :png)
