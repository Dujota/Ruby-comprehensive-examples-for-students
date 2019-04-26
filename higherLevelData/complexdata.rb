require 'json'
require 'time'

class Person
  attr_reader :balance, :name

  def initialize(name, birthdate, deposit)
    @name = name
  	@birthdate = birthdate
    @deposit   = deposit
    @age = (Time.now - @birthdate) / (365*86400)
	  @balance = @deposit * (1.05 ** @age)
  end

  def age
    @age.floor
  end
  def marshal_dump
    {name: @name, birthdate: @birthdate, deposit: @deposit}
  end
  def marshal_load(data)
    initialize(data[:name], data[:birthdate], data[:deposit])
  end

  def as_json
    {name: @name, birthdate: @birthdate.iso8601, deposit: @deposit}
  end
  def self.from_json(json)
    data = JSON.parse(json)
    birthdate = Time.parse(data["birthdate"])
    new(data["name"], birthdate, data["deposit"])
  end
end

p1 = Person.new("Ruby", Time.now - (14*365*86400), 100)
puts p1.inspect

puts "--- Marshal deep copy ---"
p2 = Marshal.load Marshal.dump(p1)
puts p2.inspect

puts "--- Json data ---"
p1 = Person.new("Ruby", Time.now - (14*365*86400), 100)
p1json = p1.as_json
puts "p1.as_json : #{p1json}"

p2 = Person.from_json JSON.dump(p1json)
puts "Person.from_json(JSON.dump(p1.as_json): \n       --> #{p2.inspect}"
