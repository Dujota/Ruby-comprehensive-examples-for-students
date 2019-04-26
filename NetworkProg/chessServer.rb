require "thread"
require "socket"

PORT=12000
# Exit if user presses Enter
waiter = Thread.new do
	puts "Press Enter to exit the server."
	gets
	exit	
end

@mutex = Mutex.new
@list = {}

def match?(p1,p2)
	puts "p1: #{p1} p2: #{p2}"
	puts "#{@list}"
	return false unless @list[p1] && @list[p2]
	puts "#{@list[p1]}  #{@list[p2]}"
	@list[p1][0] == p2 && @list[p2][0] == p1
end

def handle_client(sess, msg, addr, port, ipname)
	cmd, player1, player2 = msg.split
	# Note: We get user: hostname on the command line,
	# but we store it in the form user:address
	player1 << ":#{addr}"			# Append user's IP addr
	user2, host2 = player2.split(":")
	host2 = ipname if host2 == nil
	player2 = user2 + ":" + IPSocket.getaddress(host2)
  puts "player2 => #{player2}."
	if cmd != "login"
		puts "Protocol error: client msg was #{msg}"
	end
	puts "mutex synchronizing... with #{ipname}."
	@mutex.synchronize do 
		@list[player1] = [player2, addr, port, ipname, sess]
	end
	puts "mutex synchronized. #{player1}<=>#{player2}"

	if match?(player1, player2)
		notify_clients(player1, player2)
	end
end

def notify_clients(player1, player2)
	# Note these names are "backwards" now: player2
	# logged in first, if we got here
	p1, p2 = @mutex.synchronize do 
		[@list.delete(player1), @list.delete(player2)]
	end

	p1name = player1.split(":")[0]
	p2name = player2.split(":")[0]

  # Player ID = name.ip:color
  # Color: 0=white, 1=black
  p1id = "#{p1name}:#{p1[3]}:1"
  p2id = "#{p2name}:#{p2[3]}:0"

  sess2 = p2[4]
  sess2.puts p1id
  sess2.close

  sleep 0.2 	# let the player-server start up
  sess1 = p1[4]
  sess1.puts p2id
  sess1.close
end

# Abort in this short example, skipping threaded error-handling
Thread.abort_on_exception = true
server = TCPServer.new("0.0.0.0", PORT)
loop do 
	Thread.new(server.accept) do |sess| 
		# waiting for a msg from client
		text = sess.gets
		print "Received: #{text}"   # So we know server gets it
		domain, port, ipname, ipaddr = sess.peeraddr
		puts "#{domain},#{port},#{ipname},#{ipaddr}."
		handle_client sess, text, ipaddr, port, ipname
	end
end
