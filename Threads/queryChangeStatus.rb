t1 = Thread.new{sleep 100}

t2 = Thread.new do 
	if Thread.current == Thread.main
		puts "This is the main thread."
	end
	1.up_to(1000) {sleep 0.1}
end

count = Thread.list.size
puts "Thread.list.size: #{count}"

if Thread.list.include?(Thread.main)
	puts "Main thread is alive."
end
if Thread.current == Thread.main
	puts "I'm the main thread."
end

# in the main thread
Thread.kill(t1)  	# Kill thread t1 
puts "kill thread t1"
Thread.pass				# Give up my timeslice

t3 = Thread.new do 
	sleep 20
	Thread.exit
	puts "Can't happen!"
end
puts "kill thread t2"
Thread.kill(t2)

# Now exit the main thread -> killing any others.
Thread.exit

