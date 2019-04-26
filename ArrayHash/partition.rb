nums = (1..9).to_a
print "nums = #{nums}\n"
test1 = " .partition {|x| condition}"
puts test1.center(40, "*")
exe1 = '  $odd_even = nums.partition {|x| x % 2 == 1}'
eval(exe1)
puts exe1
puts "     --> $odd_even =#{$odd_even}"

exe2 = "  $under5 = nums.partition {|x| x < 5}"
eval(exe2)
puts exe2
puts "     --> $under5 =#{$under5}"

exe3 = "  $squares = nums.partition {|x| Math.sqrt(x).to_i**2 == x }"
eval(exe3)
puts exe3
puts "     --> $squares =#{$squares}"

test2 = " .group_by {|x| condition}"
puts test2.center(40, "*")
exe1 = "  $mod3 = nums.group_by {|x| x % 3}"
eval(exe1)
puts exe1
puts "     --> $mod3 =#{$mod3}"

words = %w[ area arboreal brick estrous clear
            donor ether filial patina ]
print words, "\n"
exe1 = '  $vowels = words.group_by {|x| x.count("aeiou") }'
puts exe1
eval(exe1)
puts "    --> $vowels = #{$vowels}"

exe2 = '  $initials = words.group_by {|x|  x[0..0]} '
puts exe2
eval(exe2)
puts "    --> $initials = #{$initials}"

