puts <<-Exp
=== Fork method ===
  The principal way to create a new process is the "fork" method, which 
	takes its name from the UNIX traditon's idea of a fork in the path
	of execution, like a fork in the road.
	The fork mehtod in Kernel(also found in the Process module) shouldn't
	be confused with the Thread instance method of the same name.

Exp

pid = fork
if (pid == nil)
  puts "Ah, I must be the child."
	puts "I guess I'll speak as a child."
else
	puts "I'm the parent."
	puts "Time to put away childish things."
end

