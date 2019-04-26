#!/usr/bin/ruby -w

# file1 = File.new("one")
# file2 = File.new("two", "w")
# file = File.new("three", 0755, File::CREATE|File::WRONLY)
# file1.close
# file2.close
# file.close

File.open("somefile", "w") do |file|
	file.puts "Line 1"
	file.puts "Line 2"
	file.puts "Third and fianl line"
end
# the file is now closed without calling close()

