filename = "sample.txt"
flag = File.exist?(filename)
puts "File.exist?(\"sample.txt\") --> #{flag}"
puts "File.exist?(\"UFO\")        --> #{File.exist?("UFO")}"

puts "File.zero?(\"sample.txt\")  --> #{File.zero?(filename)}"
puts "File.size?(\"sample.txt\")  --> #{File.size?(filename)}"

puts "File.size(\"sample.txt\")  --> #{File.size(filename)}"

info = File.stat(filename)
total_bytes = info.blocks * info.blksize
puts "info = File.stat(\"sample.txt\")  --> #{info.inspect}"
puts "total_bytes = info.blocks * info.blksize  --> #{total_bytes}"

