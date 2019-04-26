# p436 Listing 11.17 Tracing Module
module Tracing
	def self.hook_method(const, meth)
		const.class_eval do 
			alias_method "untraced_#{meth}", "#{meth}"
			define_method(meth) do |*args|
				puts "1.<#{meth}> called with params (#{args.join(', ')})"
				send("untraced_#{meth}", *args)
			end
		end
	end

	def self.included(const)
		const.instance_methods(false).each do |m|
			puts "const:#{const}, m:#{m}"
			hook_method(const, m)
		end

		def const.method_added(name)
			return if @disable_method_added
			puts "2.The method <#{name}> was added to class <#{self}>"
			@disable_method_added = true
			Tracing.hook_method(self, name)
			@disable_method_added = false
		end
		if const.is_a?(Class)
			def const.inherited(name)
				puts "3.The class <#{name}> inherited from <#{self}>"
			end
		end

		if const.is_a?(Module)
			def const.extended(name)
				puts "4.The class <#{name}> extended itself with <#{self}>"
			end
			def const.included(name)
				puts "5.The class <#{name}> included <#{self}> into itself"
			end
		end

		def const.singleton_method_added(name, *args)
			return if @disable_singleton_method_added
			return if name == :singlenton_method_added

			puts "6.The class method <#{name}> was added to class <#{self}>"
			@disable_singleton_method_added = true
			singleton_class = (class << self; self; end)
			Tracing.hook_method(singleton_class, name)
			@disable_singleton_method_added = false
		end
	end
end

class MyClass
  puts ">1.def first_meth"
	def first_meth
	end
end
class MyClass
  puts ">2.including Tracing"
	include Tracing
  puts ">3.def	second_meth(x, y)"
	def second_meth(x, y)
	end
	# def self.a_class_method(options)
	# end
end
puts ">4.m = MyClass.new"
m = MyClass.new
puts ">5.m.first_meth"
m.first_meth
puts ">6.m.second_meth(1, 'cat')"
m.second_meth(1, 'cat')

class MyClass
	puts ">7.add def self.a_class_method"
	def self.a_class_method(options)
	end
end
puts ">8.calls MyClass.a_class_method(green: \"super\")"
MyClass.a_class_method(green: "super")

puts ">9.MySubClass -------"
class MySubClass < MyClass
end

puts "10.MyModule -------"
module MyModule
	include Tracing
end

class MyClass
  puts "11.include MyModule in MyClass"
	include MyModule
  puts "12.extend MyModule in MyClass"
	extend MyModule
end


