puts <<-EOF
  Threads are also aware of the $SAFE global variable; but when it comes to threads, $SAFE is not quite as global as it seems because each thread effectively has its own.

EOF

t1 = Thread.new { $SAFE = 1; sleep 5}
t2 = Thread.new { $SAFE = 3; sleep 5}

sleep 3
level0 = Thread.main.safe_level
level1 = t1.safe_level
level2 = t2.safe_level

puts "Main $SAFE #{level0}"
puts "t1   $SAFE #{level1}"
puts "t2   $SAFE #{level2}"
Thread.kill(t1)
Thread.kill(t2)


t1 = Thread.new { loop { sleep 1}}
t2 = Thread.new { loop { sleep 1}}
t2.priority = 3 
p1 = t1.priority
p2 = t2.priority
puts "t1.priority : #{p1}, t2.priority: #{p2}"
Thread.kill(t1)
Thread.kill(t2)

t1 = Thread.new do 
	Thread.pass
	puts "First thread"
end
t2 = Thread.new do 
	puts "Second thread"
end

sleep 3
Thread.kill(t1)
Thread.kill(t2)

t1 = Thread.new do 
	Thread.stop
	puts "There is an emerald here."
end
t2 = Thread.new do 
	Thread.stop
	puts "You're at Y2."
end

sleep 0.5

t1.wakeup
t2.run

sleep 0.5
