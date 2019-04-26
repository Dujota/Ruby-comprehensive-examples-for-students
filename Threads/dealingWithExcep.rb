t1 = Thread.new do 
  puts "Hello"
	sleep 1
	raise "some exception"
end

t2 = Thread.new do 
  sleep 2
	puts "Hello from the other thread"
end

sleep 3
puts "The end"


puts <<-EOF
=== When exception would be called ===
  Exceptions inside threads are not raised until the join or value mehtod is called on that thread. It is up to some other thread to check on the thread that failed and report the failure.

EOF
t1 = Thread.new do 
  raise "Oh no!"
	puts "This will never print"
end

begin
  puts t1.status
  t1.join
rescue => e
  puts "Thread raised #{e.class}: #{e.message}"
end

puts <<-EOF
=== abort_on_exception ===
  When "abort_on_exception" flag is set to true, uncaught exceptions will terminate all running threads.

EOF

t1 = Thread.new do 
  puts "Hello"
	sleep 1
	raise "some exception"
end

t1.abort_on_exception = true

t2 = Thread.new do 
  sleep 2
	puts "Hello from the other thread"
end

sleep 3
puts "The End"

