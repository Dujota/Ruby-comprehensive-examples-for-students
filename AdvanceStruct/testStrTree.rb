require './sortBinaryTree'

items = %w[bongo grimace monoid jewel plover nexus synergy]

tree = Tree.new
items.each {|x| tree.insert x}
print items, "\n"
print tree.to_a * ", " , "\n"

tree.make_graph("strtree")
print tree.to_a, "\n"

