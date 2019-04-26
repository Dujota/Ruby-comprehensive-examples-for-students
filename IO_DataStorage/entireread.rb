filename = "sample.txt"
arr = IO.readlines(filename)
lines = arr.size
puts "sample.txt has #{lines} lines in it."

longest = arr.collect {|x| x.length}.max
puts "the longest line in it has #{longest} chars."

str = IO.read(filename)
bytes = str.size
puts "#{filename} has #{bytes} bytes in it."
#longest = str.collect {|x| x.length}.max
#puts "the longest line in it has #{longest} chars."
puts "=== IO.foreach(filename) do ==="
IO.foreach(filename) do |line|
  puts line if line =~ /Coxwell/
end

puts "=== File.new(fliename).each ==="
File.new(filename).each do |line|
  puts line if line =~ /Coxwell/
end

puts "=== File.new(fliename).each_line ==="
lines = File.new(filename).each_line
picks = lines.find{|line| line =~ /Coxwell/}
puts picks
