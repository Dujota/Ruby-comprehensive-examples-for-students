items =[1,2,3,4]
enum = items.each
puts "items=#{items}\n  enum = items.each"
puts "  enum.class \"#{enum.class}\""
puts "  enum.each {|x| puts x} "
enum.each {|x| print x," "}
puts

people = [2, "George", "Washington",
		  3, "Edgar ", "Allan ", "Poe",
		  2, "John ", "Glenn",
		  4, "Little", "Red ", "Riding ", "Hood",
		  1, "Sting"]
enum = people.each
loop do 
  count = enum.next		# first items is number
  count.times {print "  ",enum.next}
  puts
end

deck = (1..52).sort_by{rand}
dealer = deck.each_slice(5)
hands =[]
4.times do |i|
  hands << dealer.next 
end
hands.each {|x| print "    ",x, "\n"}

sequence = %w[In Xanadu did Kublai Khan 
			  a stately pleasure dome decree]
search_term = %w[stately pleasure dome]
enum = sequence.each_cons(search_term.length)
index = 0

loop do 
  triplet = enum.next
  break if triplet == search_term
  index += 1
end

if index < sequence.length - 1
  puts "Search term found at position #{index}"
else
  puts "Search term not found"
end

list = [10,20,30,40,50]
puts "#{list}"
enum = list.each
puts enum.next
puts enum.next
puts enum.next
enum.rewind
puts enum.next
