require 'open3'

filename = %w[ processFork1.rb processFork2.rb this that another one_more ]
output, errout = [],[]

Open3.popen3("xargs", "ls", "-l") do |inp, out, err|
  filename.each {|f| inp.puts f}    # Write to the process a stdin
	inp.close													# Close is necessary!
  
	output = out.readlines						# Read from its stdout
	errout = err.readlines						# Also read from its stderr
end

puts "Sent #{filename.size} ines of input."
puts "Got back #{output.size} lines of stdout."
puts "and #{errout.size} lines from stderr."
puts errout if errout.size > 0
	 
