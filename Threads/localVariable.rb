thread = Thread.new do 
	t = Thread.current
  t[:var1] = "This is a string"
  t[:var2] = 365
end

sleep 1

# Access the thread-local data from outside...
x = thread[:var1]
y = thread[:var2]
puts x, y

has_var2 = thread.key?(:var2)
puts has_var2
puts thread.key?(:var3)

thread = Thread.new do 
	t = Thread.current
	t["started_as_a_string"] = 100
	t[:started_as_a_symbol] = 101
end

sleep 1

a = thread[:started_as_a_string] 
b = thread["started_as_a_symbol"]
puts a, b
