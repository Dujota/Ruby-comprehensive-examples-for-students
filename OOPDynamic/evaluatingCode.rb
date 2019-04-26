code = <<-EOF
parameters = {}
ARGF.each do |line|
  break if /quit/ =~ line
  name, expr = line.split(/\s*=\s*/, 2)
	parameters[name] = eval expr
end

puts parameters
EOF
puts code

def some_method
  a = "local vairable"
	return binding
end

the_binding = some_method
eval "p a", the_binding

def some_method
  return binding
end

the_binding = some_method { puts "hello"}
eval "yield", the_binding

# 11.3.2 Retrieving a Constant by Name
str = "PI"
Math.const_get(str)
puts "Math.constants -> #{Math.constants}"

# 11.3.3 Retrieving a Class by Name
classname = "Array"
klass = Object.const_get(classname)
x = klass.new(4,1)
p x

class Alpha
  class Beta
	  class Gamma
		  FOOBAR = 237
		end
	end
end

str = "Alpha::Beta::Gamma::FOOBAR"
val = Object.const_get(str)
puts val


