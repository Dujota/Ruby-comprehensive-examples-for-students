
system("date")

#system("rm", "/tmp/file1")
#system("rm /tmp/file2")

system("echo *")
system("echo", "*")

system("ls -l | head -n 1")

puts <<-Explanation
==== exec replaces the current one ====
  The "exec" method behaves much the same as "system", except that the new
	process actually replaces the current one. Thus, any code following the
	exec won't be executed:

Explanation

puts "Here's a directory listing:"
exec("ls", "-l")

puts "This line is never reached!"

