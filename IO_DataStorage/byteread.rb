puts "=== File.new(filename).each_byte do |byte| ==="
a_count = 0
File.new("sample.txt").each_byte do |byte|
  a_count += 1 if byte == "a".ord
end
puts "number of 'a' in sample.txt is #{a_count}"

puts "=== File.new(filename).each_char do |char| ==="
a_count = 0
File.new("sample.txt").each_char do |char|
  a_count += 1 if char == "b"
end
puts "number of 'b' in sample.txt is #{a_count}"
