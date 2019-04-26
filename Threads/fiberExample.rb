puts <<-Explanation
==== Fiber process ; this is called co-routine or semi-routine ====
  Fiber can be described as cut-down threads or as code blocks with superpowers.
  Fibers do NOT create an OS thread, but they can contain a block of code
	that maintains its state, can be paused and resumed, and can yield results.

Explanation

require 'fiber'

class MaxFiber < Fiber
  attr_accessor :result
end

def max_by_fiber(interval, collections)
  fibers = []
	collections.each_with_index do |numbers|
	  fibers << MaxFiber.new do 
		  me = Fiber.current
			me.result = numbers[0]
			numbers.each_with_index do |n, i|
			  me.result = n if n > me.result
				Fiber.yield me.result if (i+1) % 3 == 0
			end
			me.result
		end
	end

	start_time = Time.now
	while fibers.any? &:alive?
		break if Time.now - start_time > interval
		fibers.each {|f| puts f.resume if f.alive? }
	end

	values = fibers.map &:result
	values.compact.max || 0
end

collections = [
  [1, 25, 3, 7, 42, 64, 55],
	[ 3, 77],
	[ 3, 33, 7, 44, 77, 102, 92, 10, 11],
	[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 77, 2, 3]
]

biggest = max_by_fiber(0.5, collections)


