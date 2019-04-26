puts <<-Explanation
=== Simple test of Fiber ===
   child fiber calls Fiber.yield, then this switches to parent fiber to execute. And Fiber.yield argument sends to return value of the parent fiber Fiber#resume
Explanation

require 'fiber'

f = Fiber.new do 
  n = 0
	loop do 
	  Fiber.yield(n)
		n += 1
	end
end

5.times do 
  p f.resume
end

puts "=== transfers internal iterator to external one. ==="
def enum2gen(enum)
  Fiber.new do 
	  enum.each {|i|
		  Fiber.yield(i)
    }
	end
end

g = enum2gen(1..100)

p g.resume
p g.resume
p g.resume

