puts "=== Detecting in a Hash ==="
a = {"a" => 1, "b" => 2}
puts "a = #{a}"
puts "   a.has_key? \"c\" --> #{a.has_key? "c"} "
puts "   a.include? \"a\" --> #{a.include? "a"} "
puts "   a.key? 2       --> #{a.key? 2} "
puts "   a.member? \"b\"  --> #{a.member? "b"} "
puts "   a.length       --> #{a.length} "
puts "   a.has_value? 2 --> #{a.has_value? 2}"
puts "   a.value? 99    --> #{a.value? 99}"

puts "=== Extracting Hashes into Array ==="
h = {"a" => 1, "b" => 2}
puts "h = #{h}"
puts "   h.to_a         --> #{h.to_a}"
puts "   h.keys         --> #{h.keys}"
puts "   h.values       --> #{h.values}"

h = {1 => "one", 2 => "two", 3 => "three", 4 => "four", "cinco" => "five"}
puts "h = #{h}"
exe1 = 'h.values_at(3, "cinco", 4)'
puts "   #{exe1} --> #{eval(exe1)}"
exe2 = "h.values_at(1,3)"
puts "   #{exe2}           --> #{eval(exe2)} "
