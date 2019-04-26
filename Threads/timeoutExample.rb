puts <<-EXPLANATION
=== Timeout for an Operation ===
  To set a maximum length of time for some code to run.
	This is most useful when interacting with remote computers over a network.
	The timeout library is a thread-based solution to this problem.
	The timeout method executes the block associated with the method call;
	when the sepcified number of seconds has elapsed, it throws a Timeout::Error, which can be caught with a rescue clause.

EXPLANATION

require 'timeout'

flag = false
answer = nil

begin 
  Timeout::timeout(5) do 
	  puts "I want a cookie!"
		answer = gets.chomp
		flag = true
	end
rescue Error
  flag = false
end

if flag
	if answer == "cookie"
		puts "Thank you! Chomp, chomp, ..."
  else
		puts "That's not a cookie!"
		exit
	end
else
	puts "Hey, too slow!"
	exit
end

puts "Bye now..."

