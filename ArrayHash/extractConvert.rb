hash = {1 => 2, 3 => 6, 4 => 8, 5 => 10, 7 => 14}
arr1 = hash.take(2)
arr2 = hash.take_while {|k,v| v <= 8}
arr3 = arr1.take(1)
arr4 = arr2.take_while {|x| x[0] < 4}
puts "hash = #{hash}"
puts "  arr1 = hash.take(2) :  #{arr1}"
puts "  arr2 = hash.take_while {|k,v| v <= 8} :  #{arr2}"
puts "  arr3 = arr1.take(1) :  #{arr3}"
puts "  arr4 = arr2.take_while {|x| x[0] < 4}) :  #{arr4}"

puts "  hash.drop(2) : #{hash.drop(2)}"
arr2 = hash.drop_while {|k,v| v <= 8} 
puts "  hash.drop_while {|k,v| v <= 8} : #{arr2}"

range = 3..6
puts "range = #{range}"
puts "range.reduce(:*)   --> #{range.reduce(:*)} (3*4*5*6)"
puts "range.reduce(:+)   --> #{range.reduce(:+)} (3+4+5+6)"
puts "range.reduce(2,:*) --> #{range.reduce(2,:*)} (2*3*4*5*6)"

acc1 = range.reduce(10) {|acc, item| acc += item}
puts "range.reduce(10) {|acc, item| acc += item} --> #{acc1}"
