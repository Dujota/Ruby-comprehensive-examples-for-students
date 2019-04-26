itercode1 = <<-EOF
{"a" => 3, "b" => 2}.each do |key, val|
  print val, " from ", key, "; "
end
	EOF
puts "--- .each -> key,val ---"
puts itercode1
eval(itercode1)
puts

itercode2 = <<-EOF
{"a" => 3, "b" => 2}.each_key do |key|
  print "key = " , key, "; " 
end
	EOF
puts "--- .each_key -> key ---"
puts itercode2
eval(itercode2)
puts

itercode3 = <<-EOF
{"a" => 3, "b" => 2}.each_value do |value|
  print "val = ", value, "; "
end
	EOF
puts "--- .each_value -> value ---"
puts itercode3
eval(itercode3)
puts

puts " .each do |key|  --> "
{"a" => 3, "b" => 2}.each do |key|
  print "key =",key, "; "
end
puts
