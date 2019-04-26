a = "hello"
puts "The string 'hello' has an object id #{a.object_id}"
ObjectSpace.define_finalizer(a) { |id| puts "Destroying #{id}"}
puts "Nothing to tidy"
GC.start
a = nil
puts "The original string is now a candidate for collection"
GC.start


puts "=== File.open and close issue ==="
puts <<-DOC
There is no guarantee that an object will undergo garbage collection before
the program terminates. 
However, all this might be moot. There's a style of programming that uses
blocks to encapsulate the use of a resource. At the block, the resource is
deleted, and ife carries on merrily, all without the use of finalizers.

DOC
puts <<-DOC
----- code -----
File.open("finalizer.rb") do |file|
  line = file.gets
end
---------------
DOC
puts <<-END
File.open in Ruby might look something like this:
----
def File.open(name, mode = "r")
  f = os_file.open(name, mode)
	if block_given?
		begin
		  yield f
		ensure
		  f.close
		end
		return nil
	else
		return f
	end
end
END

