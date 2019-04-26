require 'thread'

mutex = Mutex.new

t1 = Thread.new do 
  mutex.lock
	sleep 10
end

t2 = Thread.new do 
  if mutex.try_lock
		puts "Locked it"
	else
		puts "Could not lock"
	end
end

t1.join
t2.join

puts "Mutex instances also have a 'synchronize' method that takes a block"

x = 0
mutex = Mutex.new

t1 = Thread.new do 
  1.upto(1000000) do 
	  mutex.synchronize { x = new_value(x)}
	end
end
