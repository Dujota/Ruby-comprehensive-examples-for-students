def asbestos
  puts "Now fireproof"
end

tax = 0.08

PI = 3

asbestos
puts "PI=#{PI}, tax=#{tax}"

undef asbestos
#undef tax
#undef PI

class Parent
  def alpha
	  puts "parent alpha"
	end
  def beta
	  puts "parent beta"
	end
end

class Child < Parent
  def alpha
	  puts "child alpha"
	end
	def beta
	  puts "child beta"
	end

	remove_method :alpha
	undef_method :beta
end

x = Child.new
x.alpha
x.beta

