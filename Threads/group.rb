puts "Initial group is #{ThreadGroup::Default.list}"

tg = ThreadGroup.new
t1 = Thread.new{sleep}
t2 = Thread.new{sleep}

puts "t1 is #{t1}"
puts "t2 is #{t2}"

tg.add(t1)

puts "Initial group now #{ThreadGroup::Default.list}"
puts "tg group now #{tg.list}"

Thread.kill(t1)
Thread.kill(t2)

t1 = Thread.new("file1") {sleep 1}
t2 = Thread.new("file2") {sleep 2}

threads = ThreadGroup.new
threads.add t1
threads.add t2

count = 0
threads.list.each {|x| count += 1 if x.alive?}
if count < threads.list.size
	puts "Some threads in this group are not living."
else
	puts "All threads in this group are alive."
end


# Reference concerned with Group
class ThreadGroup
  def wakeup
	  list.each { |t| t.wakeup}
	end
	def join
	  list.each {|t| t.join if t != Thread.current}
	end
  def kill
	  list.each { |t| t.kill }
	end
end

