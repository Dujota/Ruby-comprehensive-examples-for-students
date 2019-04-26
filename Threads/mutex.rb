require 'thread'

def new_value(i)
  i + 1
end

x = 0
mutex = Mutex.new

t1 = Thread.new do 
  1.upto(1000000) do 
	  mutex.lock
		x = new_value(x)
		mutex.unlock
	end
end

t2 = Thread.new do 
  1.upto(1000000) do 
	  mutex.lock
		x = new_value(x)
		mutex.unlock
	end
end

t1.join
t2.join
puts x

