# p395 Listing 11.9 Using a Method by a Prarmeter

class Person
	attr_reader :name, :age, :height
	def initialize(name, age, height)
		@name, @age, @height = name, age, height
	end
	def inspect
		"#@name #@age #@height"
	end
end
class Array
	def map_by(sym)
		self.map {|x| x.send(sym)}
	end
end

people = []
people << Person.new("Hansel", 35, 69)
people << Person.new("Gretel", 32, 64)
people << Person.new("Ted", 36, 68)
people << Person.new("Alice", 33, 63)
people.each {|obj| puts obj.inspect}

p1 = people.map_by(:name)
puts ":name   - #{p1}"
p2 = people.map_by(:age)
puts ":age    - #{p2}"
p3 = people.map_by(:height)
puts ":height - #{p3}"
