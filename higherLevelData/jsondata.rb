require 'json'

data = {
	string: "Hi there", 
	array: [1,2,3],
	boolean: true,
	object: Object.new
}

puts JSON.dump(data)

