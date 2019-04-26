a1 = Hash.[]("flat", 3, "curved", 2)
a2 = Hash.[]("flat" => 3, "curved" => 2)
b1 = Hash["flat", 3, "curved", 2]
b2 = Hash["flat" => 3, "curved" => 2]
puts "Hash.[](\"flat\", 3, \"curved\", 2)     -> #{a1}"
puts "Hash.[](\"flat\" => 3, \"curved\" => 2) -> #{a2}"
puts "Hash[\"flat\", 3, \"curved\", 2]        -> #{b1}"
puts "Hash[\"flat\" => 3, \"curved\" => 2]    -> #{b2}"

h1 = {:alpha => 123, :beta => 456}
h2 = { alpha: 123, beta: 456}
puts " h1 = {:alpha => 123, :beta => 456} -> #{h1}"
puts " h2 = { alpha:   123,  beta:   456}      -> #{h2}"
puts " h1 == h2   -> #{h1 == h2}"



