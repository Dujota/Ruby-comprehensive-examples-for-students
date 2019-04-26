require 'socket'

udp = UDPSocket.new
udp.connect("128.0.0.0", 7)
ipaddr = Socket.unpack_sockaddr_in(udp.getsockname)[1]
udp.close

puts <<-Exp
=== Simple HTTP Server ===
   Access #{ipaddr}:3000 on Browser.
	 Result should be "Hello from Ruby!"
	   
Exp

server = TCPServer.new 3000

loop do 
  # Accept the connection
	socket = server.accept

  # Print the request, which ends in a blank line
	puts line = socket.readline until line == "\r\n"
 
  # Tell the brower we are an HTTP server
	socket.write "HTTP/1.1 200 OK\r\n"
  # Tell the browser the body is 52 bytes
	socket.write "Content-Length: 51\r\n"
  # Empty line to separate headers from body
	socket.write "\r\n"
  # Write the HTML that makes up the body
  socket.write "<html><body>"
	socket.write "<h1>Hello from Ruby!</h1>"
	socket.write "</body></html>\n"
  # Close the connection
	socket.close
end


