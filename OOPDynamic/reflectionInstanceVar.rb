class SomeClass
  def initialize
	  @a = 1
		@b = 2
	end
  def mymeth
	end
	protected :mymeth

end

x = SomeClass.new
def x.newmeth
end

iv = x.instance_variables
puts "instance_vaiables : #{iv}"
puts x.methods.size
puts x.public_methods.size
puts x.public_methods(false).size

puts x.private_methods.size
puts x.private_methods(false).size

puts x.protected_methods.size
puts x.singleton_methods.size
