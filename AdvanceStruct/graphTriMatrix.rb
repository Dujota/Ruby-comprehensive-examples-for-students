#! /usr/bin/ruby -w
class ZeroArray < Array 
	def [](x)
		if x > size
			(size+1..x).each {|i| self[i] = 0}
		end
		# v = super(x)
		super(x)
	end
	def []=(x,v)
		max = size 
		super(x,v)
		if size - max > 1
			(max..size-2).each {|i| self[i] = 0}
		end
	end
end

class TriMatrix
	def initialize
		@store =[]
	end
	def [](x, y)
		if x > y
			index = (x * x + x)/2 + y
			@store[index]
		else
			raise IndexError
		end
	end
	def []=(x, y, v)
		if x > y
			index = (x * x + x)/2 + y
			@store[index] = v
		else
			raise IndexError
		end
	end
end
