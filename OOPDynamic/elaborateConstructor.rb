# 11.1.3 Using More Elaborate Constructors p367 of RubyWay

class Library
	attr_reader :shelves

	def initialize(&block)
		instance_eval(&block)
	end
protected
  attr_writer :shelves
end

branch = Library.new do 
	self.shelves = 10
end

#branch.shelves = 20 	# NoMethodError
p branch.shelves 
