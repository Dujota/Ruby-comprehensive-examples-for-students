# p385 Working with Modules

module MyMod
	def self.included(klass)
		puts "Module:" + self.to_s + " has been included by " \
						 + "klass:" + klass.to_s 
		def klass.module_method
			puts "Module (class) mehtod"
		end
	end
	def method_1
		puts "Method 1"
	end
end
class MyClass
	include MyMod

	def self.class_method
		puts "Class method"
	end
	def method_2
		puts "Method 2"
	end
end

x = MyClass.new

MyClass.class_method   # exe MyClass self.class_method
x.method_1						 # exe MyClass->MyMod mothod1
MyClass.module_method  # exe MyClass->MyMod self.included ->klass.modulexxx
x.method_2             # 

module MyMod
	def meth3
		puts "Module instance method meth3"
		puts "can become a class method"
	end
end
class MyClass
	class << self
		include MyMod
	end
end

MyClass.meth3
