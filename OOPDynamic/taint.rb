puts <<-EXPLANATION
=============
There are potential "security holes" in some Ruby code such as eval method.
If the string it is passed originates in the outside world, it is possible for a malicious user to cause arbitrary code to be executed.
The first feature that defends against these kinds of attacks is the safe level. The safe level is stored in a thread-local global variable and defaults to 0. Assigning a number to $SAFE sets the safe level.
When safe level is 1 or higher, Ruby starts blocking certain dangerous actions using tainted objects. Every object has a tainted or non-tinted status flag.
=============
EXPLANATION

str1 = "puts 'The answer is: '"
str2 = ARGV.first.dup

puts "#{str1}.tainted? -> #{str1.tainted?}"
puts "ARGV.first.dup.tainted? -> #{str2.tainted?}"

str1.taint
str2.untaint
puts "str1.taint -> #{str1.tainted?}"
puts "str2.untaint -> #{str2.tainted?}"

eval(str1)
puts eval(str2)

puts "$SAFE : #{$SAFE}"
$SAFE = 1
puts "$SAFE = 1 -> #{$SAFE}"

eval(str1)
puts eval(str2)

