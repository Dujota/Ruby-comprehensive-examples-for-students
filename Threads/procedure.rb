factorial1000 = Thread.new do 
  begin
	  prod = 1
		1.up_to(1000) {|n| prod *= n}
		puts "1000! = #{prod}"
	rescue

	end
end

sleep 0.1
if factorial1000.alive?
  factorial1000.raise("Stop!")
	puts "Calculation was interrupted!"
else
	puts "Calculation was successful."
end

