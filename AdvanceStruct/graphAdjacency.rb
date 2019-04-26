#! /usr/bin/ruby -w
require './graphTriMatrix'

class LowerMatrix < TriMatrix
	def initialize
		@store = ZeroArray.new
	end
end
class Graph
	def initialize(*edges)
		@store = LowerMatrix.new
		@max = 0
		edges.each do |e| 
			e[0], e[1] = e[1], e[0] if e[1] > e[0]
			@store[e[0], e[1]] = 1
			@max = [@max, e[0], e[1]].max
			puts "(#{e[0]}, #{e[1]}) => #{@store[e[0], e[1]]} #{@store.inspect}"
		end
	end
	def [](x,y)
		if x > y
			@store[x, y]
		elsif x < y
			@store[y, x]
		else
			0
		end
	end
	def []=(x, y, v)
		if x > y
			@store[x, y] = v
		elsif x < y
			@store[y, x] = v
		else
			0
		end
	end
	def edge?(x, y)
		x, y = y, x if x < y
		@store[x, y] == 1
	end
	def add(x, y)
		@store[x, y] = 1
	end
	def remove(x, y)
		x, y = y, x if x < y
		@store[x, y] = 0
		if (degree @max) == 0
			@max -= 1
		end
	end
	def vmax
		@max 
	end
	def degree(x)
		(0..@max).inject(0) {|sum, i| sum + self[x, i]}
	end
	def each_vertex
		(0..@max).each {|v| yield v}
	end
	def each_edge
		(0..@max).each do |v0|
			(0..v0-1).each do |v1|
				yield v0, v1 if edge?(v0, v1)
				print "[#{v0},#{v1}] => "
			end
		end
	end
	def connected?
		x = vmax
		k = [x]
		l = [x]
		for i in 0..@max 
			1 << i if self[x, i] == 1
		end
		while !k.empty?
			y = k.shift
			# Now find all edges (y, z)
			self.each_edge do |a, b|
				if a == y || b==y
					z = a==y ? b : a
					if !l.include? z
						l << z
						k << z
					end
				end
			end
		end
		if l.size < @max 
			false
		else
			true
		end
	end
	def euler_circuit?
		return false if !connected?
		(0..@max).each do |i| 
			return false if degree(i) % 2 != 0
		end
		true
	end
	def euler_path?
		return false if !connected?
		odd = 0
		each_vertex do |x| 
			if degree(x) % 2 == 1
				odd += 1
			end
		end
		odd <= 2
	end

end

mygraph = Graph.new([1,0],[0,3],[2,1],[3,1],[3,2])
# Print the degrees of all the vertices: 2 3 2 3
mygraph.each_vertex {|v| print mygraph.degree(v).to_s + " "}
puts

# Print the list of degree
mygraph.each_edge do |a, b|
	print "(#{a},#{b})" + ","
end
puts

#Remove a single edge
mygraph.remove 1,3
# Print the degrees of all the vertices: 2 2 2 2
mygraph.each_vertex {|v| print mygraph.degree(v).to_s + " "}
puts
puts mygraph.inspect


mygraph = Graph.new([0,1],[1,2],[1,3],[2,3],[3,0])
puts "euler_circuit, euler_path:"
puts mygraph.euler_circuit?
puts mygraph.euler_path?
