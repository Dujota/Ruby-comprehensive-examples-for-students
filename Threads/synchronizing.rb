def new_value(i)
  i + 1
end

x = 0

t1 = Thread.new do 
  1.upto(1000000) {x = new_value(x)}
end
t2 = Thread.new do 
  1.upto(1000000) { x = new_value(x)}
end

t1.join
t2.join
puts x

puts <<EOF
=== the following code publich the deprecated error ===
t1 = Thread.new do 
  1.upto(1000000) do 
	  Thread.exclusive { x = new_value(x)}
	end
end

t2 = Thread.new do 
  1.upto(1000000) do 
	  Thread.exclusive { x = new_value(x)}
	end
end

t1.join
t2.join
puts x
EOF

