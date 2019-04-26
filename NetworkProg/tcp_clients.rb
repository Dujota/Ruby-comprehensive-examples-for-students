require "socket"
host = "localhost"
#host = "10.2.244.25"
session = TCPSocket.new(host, 12321)
puts "The time is #{session.gets.chomp}"
session.close
