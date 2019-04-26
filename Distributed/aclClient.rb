require 'drb'
# SERVER_URI = "druby://127.0.0.1:61676"
SERVER_URI = "druby://192.168.2.190:61676"
user_server = DRbObject.new_with_uri(SERVER_URI)

user = user_server.find(1)

puts user.class

puts "user: #{user.inspect}"
puts "original username: #{user.username}"

user.username = "Bob Smith"

puts user.save

user = user_server.find(1)

puts "username now: #{user.username}"
