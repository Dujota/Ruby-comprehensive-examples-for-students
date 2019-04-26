meaning_of_life = Thread.new do 
  puts "The answer is..."
	sleep 2
	puts 42
end

meaning_of_life.join  # Wait for the thread to finish

#Thread.list.each {|t| t.join if t != Thread.current}


