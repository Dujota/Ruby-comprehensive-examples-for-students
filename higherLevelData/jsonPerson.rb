require 'json'
require 'time'

class Person
  # other methods as before

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
p1.as_json

p2 = Person.from_json JSON.dump(p1.as_json)

