class Module
  def const_missing(x)
	  "from module"
	end
end
class X
end

p X::BAR
p BAR
p Array::BAR

class CommandWrapper
  def method_missing(method, *args)
	  system(method.to_s, *args)
	end
	def respond_to_missing?(method,include_all)
	  system("which #{method} > /dev/null")
	end
end
puts "=== method_missing test === "
cw = CommandWrapper.new
cw.date
cw.du '-s', '../../'
puts "=== respond_to_missing? === "

cw = CommandWrapper.new
puts cw.respond_to?(:foo)
puts cw.method(:echo)
puts cw.respond_to?(:echo)



