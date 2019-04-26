require 'yaml'

Person = Struct.new(:name)

puts YAML.dump("Hello, world.")
puts YAML.dump({this: "is a hash", with: "symbol keys and string values"})
puts YAML.dump([1,2,3])
puts YAML.dump Person.new("Alice")

