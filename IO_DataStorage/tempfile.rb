require "tempfile"

temp = Tempfile.new("stuff")
name = temp.path
puts "name -> #{name}"
temp.puts "Kilroy was here"
temp.close

temp.open
str = temp.gets
temp.close(true)

puts "temp.gets --> #{str}"
