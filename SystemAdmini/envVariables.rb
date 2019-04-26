mypath = ENV["PATH"]
dirs = mypath.split(":")
puts "=== ENV[\"PATH\"].split(\":\")  ==="
puts dirs

puts "=== all environment variables ==="
ENV.each {|env| p env}

puts "=== Different Environment variables btw Parent and Child process ==="
ENV["alpha"] = "123"
ENV["beta"] = "456"
puts "Parent: alpha = #{ENV['alpha']}"
puts "Parent: beta  = #{ENV['beta']}"

fork do
  x = ENV["alpha"]
	ENV["beta"] = "789"
	y = ENV["beta"]
	puts " Child: alpha = #{x}"
	puts " Child: beta  = #{y}"
end

Process.wait
a = ENV["alpha"]
b = ENV["beta"]
puts "Parent: alpha = #{a}"
puts "Parent: beta  = #{b}"

puts "=== ENV isn't really a hash and we can't call the invert either ==="
puts <<-END
   The reason for this implementation is the close tie between the ENV object
	 and the underlying operating system.

END
envhash = ENV.to_hash
val2var = envhash.invert

