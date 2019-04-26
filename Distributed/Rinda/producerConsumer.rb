require 'rinda/tuplespace'

ts = Rinda::TupleSpace.new

producer = Thread.new do 
  item = 0
	loop do 
	  sleep rand(0)
    puts "Producer makes item ##{item}"
		ts.write ["Item", item]
		item += 1
	end
end

consumer = Thread.new do 
  loop do 
	  sleep rand(0)
		tuple = ts.take ["Item", nil]
		word, item = tuple
		puts "   -> Consumer retrieves item ##{item}"
	end
end

sleep 20

