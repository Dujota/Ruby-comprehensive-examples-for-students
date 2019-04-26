time = Time.now
today = time.strftime("%Y-%m-%d %H:%M:%S %A")
puts today
#str = time.strftime("%A")
if today =~ /Saturday|Sunday/
	define_method(:activity) {puts "Playing"}
else
	define_method(:activity) {puts "Working"}
end

activity
puts "=== define_method how to work ==="
code = <<-EOF
  class MyClass
    define_method(:body_method) {puts "The class body."}
    def self.new_method(name, &block)
      define_method(name, &block)
    end
  end

  MyClass.new_method(:class_method) { puts "A class method."}
  x = MyClass.new
  x.body_method
  x.class_method
EOF
puts code
puts "-----"
eval(code)

puts "=== .send(:difine_method, name, &block) ==="
class MyClass
  def new_method(name, &block)
	  self.class.send(:define_method, name, &block)
	end
end

x = MyClass.new
x.new_method(:instance_method) { puts "An instance method."}
x.instance_method

puts "=== Check scope using define_method ==="
class MyClass
  def self.new_method(name, &block)
	  define_method(name, &block)
  end
end

a, b = 3, 79
MyClass.new_method(:compute) {a*b}
x = MyClass.new
puts x.compute
a, b = 23,24
puts x.compute

puts "=== Check scope of class, instance, local variable ==="

