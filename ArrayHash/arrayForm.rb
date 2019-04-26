a = Array.[](1,2,3,4)
b = Array[1,2,3,4]
c = [1,2,3,4]
puts "Array[](1,2,3,4) -> #{a}"
puts "Array[1,2,3,4]   -> #{b}"
puts "c = [1,2,3,4]    -> #{c}"
puts "== Array.new check =="
puts "  Array.new    -> #{Array.new}"
puts "  Array.new(3) -> #{Array.new(3)}"
puts "== Array.new(3,\"blah\") and Array.new(3){\"blah\"} =="
f = Array.new(3,"blah")
puts "  f = Array.new(3,\"blah\") -> #{f}"
puts "  f[0].upcase!   -> #{f[0].upcase!}  but f:#{f} are all updated!"
g = Array.new(3) {"blah"}
puts "  g = Array.new(3){\"blah\"} -> #{g}"
puts "  g[0].upcase!   -> #{g[0].upcase!}  but g:#{g}"


