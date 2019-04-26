require "socket"

server = TCPServer.new(12321)

loop do 
	Thread.new(server.accept) do |session|
		session.puts Time.new
		session.close
	end

	# session = server.accept
	# puts session.inspect
	# session.puts Time.new
	# session.close
end
