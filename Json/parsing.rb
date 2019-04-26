require 'json'

data = JSON.parse('{"students":[
   {"name":"Alice", "grade":4},
	 {"name":"Bob", "grade":3}
	]}')

p data["students"].first.values_at("name","grade")

