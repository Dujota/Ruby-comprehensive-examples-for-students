require "socket"
puts <<-EOF
server = UDPSocket.open
server.bind nil, 12321
EOF
server = UDPSocket.open
server.bind nil, 12321		# .bind(host,port)

loop do 
  puts "Wait recv from client - text,sender=server.recvfrom(5)"
	text, sender = server.recvfrom(5)
	puts "received msg:#{text} from #{sender[3]} port:#{sender[1]}"
	msg = Time.now.to_s
	puts ".send msg:#{msg} to #{sender[3]} port:#{sender[1]}"
	server.send("#{msg}\n", 0, sender[3], sender[1])
end
