require 'thread'

buffer = SizedQueue.new(5)

producer = Thread.new do 
  item = 0
	loop do 
	  sleep (rand * 0.1)
		puts "Producer makes #{item}"
		buffer.enq item
		item += 1
	end
end

consumer = Thread.new do 
  loop do 
	  sleep((rand * 0.1) + 0.09)
		item = buffer.deq
		puts "Consumer retrieves #{item}"
		puts "  waiting = #{buffer.num_waiting}"
	end
end

sleep 10

buff = Queue.new
buff.enq "one"
buff.enq "two"
buff.enq "three"
n1 = buff.size
flag1 = buff.empty?
puts "n1:#{n1},flag1 =#{flag1}"

buff.clear
n2 = buff.size
flag2 = buff.empty?
puts "n2:#{n2},flag2 =#{flag2}"
