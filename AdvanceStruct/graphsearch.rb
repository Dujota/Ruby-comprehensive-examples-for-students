#! /usr/bin/ruby -w
require 'graphTriMatrix'
# 頂点
class Vertex
end
# 枝
class Edge
	def initialize(s, e)
		@s = s		# start
		@e = e 		# end
	end
	attr_reader :e
end

class Graph
	def initialize(vs, h)
		@vs = vs
		@es = {}
		h.each_key do |k| 
			@es[k] = []
			h[k].each {|e| @es[k] << Edge.new(k,e)}
		end
	end
	def get_edges(v)
		@es[v]  	#頂点vからのすべふの枝(Array)を返す
	end

	# goalを見つければtrue, 見つけなければfalseを返す
	def find(start, goal)
		dfs(start, goal, [])
	end
	# 深さ優先探索(再帰版)   Depth-First Search dfs
	def dfs(v, goal, visited)
		return true if v == goal
		return false if visited.include?(v)
		visited << v
		return false unless (edges = get_edges(v))
		edges.each {|edge| return true if dfs(edge.e, goal, visited) }
		false
	end
	# 深さ優先探索(ループ版)   Depth-First Search dfs
	def iter(start,goal)
		visited =[]
		q = [start]
		while !q.empty?
			v = q.pop
			return true if v == goal
			next if visited.include?(v)
			visited << v
			next unless (edges = get_edges(v))
			edges.each do |edge|
				next if visited.include?(edge.e)
				q.push(edge.e)
			end
		end
		false
	end
	# 幅優先探索   Breadth-First Search dfs
	def bfs(start,goal)
		visited = []
		q  = [start]
		while !q.empty?
			v = q.shift
			return true if v == goal
			next if visited.include?(v)
			visited << v
			next unless (edges = get_edges(v))
			edges.each do |edge|
				next if visited.include?(edge.e)
				q.push(edge.e)
			end
		end
		false
	end
end

vs = [1,2,3,4,5,6,7]
eh = {1 =>[2,5,7], 2=>[3,4], 5=>[4,6], 6=>[4]}
g = Graph.new(vs,eh)

vs.each {|v| p g.get_edges(v)}; puts
puts "深さ優先探索(再帰版)"
1.upto(7) {|i| print "#{g.find(5, i)}  "}; puts
puts "深さ優先探索(ループ版)"
1.upto(7) {|i| print "#{g.iter(5, i)}  "}; puts
puts "幅優先探索"
1.upto(7) {|i| print "#{g.bfs(5, i)}  "}; puts
