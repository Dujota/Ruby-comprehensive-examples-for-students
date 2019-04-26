require 'set'

s1 = Set[3,4,5]
arr = [3,4,5]
s2 = Set.new(arr)
s3 = Set.new(arr) {|x| x.to_s}
puts s1.inspect
puts s2.inspect
puts "s1 == s2 --> #{s1 == s2}"
puts s3.inspect

