require 'drb'
require 'logger'
#URI_IP = '10.38.20.6'
URI_IP = '10.2.160.92'
#URI_IP = 'localhost'

class HelloWorldServer
	def say_hello
		puts "received say_hello #{self}"
		'Hello, world!'
	end
end
puts <<-EOF
DRb.start_service("druby://#{URI_IP}:61676", HelloWorldServer.new)
#DRb.start_service("druby://127.0.0.1:61676", Logger.new(STDOUT))
DRb.thread.join

EOF
DRb.start_service("druby://#{URI_IP}:61676", HelloWorldServer.new)
#DRb.start_service("druby://127.0.0.1:61676", Logger.new(STDOUT))
DRb.thread.join
	
