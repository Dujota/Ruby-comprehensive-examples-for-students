
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
