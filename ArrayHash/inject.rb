nums = [3,5,7,9,11,13]
puts "nums =#{nums}"
exe1 = "nums.inject(0) {|x, n| x + n}"
puts "  #{exe1}  --> #{eval(exe1)}"
exe2 = "nums.inject {|x, n| x + n}"
puts "  #{exe2}  --> #{eval(exe2)}"

code1 = <<-EOF
  sum = 0
  nums.each {|n| sum += n}
  puts "   --> " + sum.to_s
EOF
puts code1
eval(code1)
puts "--- Sample code of using block for inject ---"
words = %w[ alpha beta gamma delta epsilon eta theta]
print words, "\n"
code2 = <<-EOF
$longest_word = words.inject do |best, w|
  w.length > best.length ? w : best
end
EOF
puts code2
#eval(code2)
$longest_word = words.inject do |best, w|
  puts "  #{best}:#{w}";  w.length > best.length ? w : best
end
puts "  --> longest word is \"#{$longest_word}\""

