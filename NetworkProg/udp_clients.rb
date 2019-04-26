require "socket"
require "timeout"

socket = UDPSocket.open
socket.connect("localhost", 12321)
puts <<-EOF
	# send(mesg, flags,host, port) = numbtyes_sent
  socket.send("Hi UDPServer", 0)
EOF
socket.send("Hi UDPServer", 0)

status = Timeout::timeout(10) do 
	time = socket.gets
	puts "received msg: #{time} from where socket.connect sets"
end

