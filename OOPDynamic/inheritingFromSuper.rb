# 11.1.5 Inheriting from a Superclass
# P372 

class Person
  attr_accessor :name, :age, :sex
  def initialize(name, age, sex)
    @name, @age, @sex = name, age, sex
  end
end
class Student < Person
  attr_accessor :id_number, :hours
  def initialize(name, age,sex, id_number, hours)
    super(name, age, sex)
    @id_number = id_number
    @hours = hours
  end
end

# Create two objects
a = Person.new("Dave Bowman", 37, "m")
b = Person.new("Franklin Poole", 36, "m", "000-13-5031", 24)
puts a.inspect
puts b.inspect

# p384 11.1.11 Understanding allocate - Not call initialize when class
class Person
  attr_accessor :name, :age, :phone
  
  def initialize(n, a, p)
    @name, @age, @phone = n, a, p
  end
end

p1 = Person.new("John Smith", 29, "555-1234")
p2 = Person.allocate
p p1.age
p p2.age

