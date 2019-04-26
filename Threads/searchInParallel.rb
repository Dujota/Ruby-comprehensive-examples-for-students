puts <<-Explanation
=== searching by each thread individually ===
  Activates thread for array[n] and searches Max value in it.

Explanation

require 'thread'

def threaded_max(interval, collections)
  threads = []
	collections.each do |col|
	  threads << Thread.new do 
		  me = Thread.current
			me[:result] = col.first
			col.each do |n|
			  me[:result] = n if n > me[:result]
			end
		end
	end
	
	sleep(interval)

	threads.each {|t| t.kill}
	puts "#{threads[0]} searches #{collections[0]}"
	puts "#{threads[1]} searches #{collections[1]}"
	puts "#{threads[2]} searches #{collections[2]}"
	results = threads.map {|t| t[:result]}
  puts "results = #{results} -> max:#{results.compact.max}"
	#puts results.compact.max
end

collections = [
[ 1,25,3,7, 42, 64, 55],
[ 3, 77, 1, 2, 3, 5, 7, 9, 11, 13, 102, 67, 2, 1],
[ 3, 33, 7, 44, 77, 92, 10, 11]]

biggest = threaded_max(0.5, collections)

