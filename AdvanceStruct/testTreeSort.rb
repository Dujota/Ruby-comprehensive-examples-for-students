require './sortBinaryTree'

items = [50,20,80,10,30,70,90,5,14,28,41,66,75,88,96]

tree = Tree.new

items.each {|x| tree.insert(x)}

# tree.inorder {|x| print x," "}
# puts
# tree.preorder {|x| print x," "}
# puts
# tree.postorder {|x| print x," "}
# puts

tree.make_graph

# s1 = tree.search(75)
# puts s1.inspect

# s2 = tree.search(100)
# puts s2.inspect
