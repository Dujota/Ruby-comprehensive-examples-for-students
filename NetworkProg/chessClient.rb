#!/usr/bin/ruby -w
require "socket"
require "timeout"

ChessServer  	= "192.168.2.190"
ChessServerPort = 12000
PeerPort 			= 12001
White, Black  = 0, 1

def draw_board(board)
	puts <<-EOF
		+-----------------------------------+
		| Stub! Drawing the board here...   |
		+-----------------------------------+
	EOF
end

def analyze_move(who,move, num, board)
	# Stub - black always wins on 4th move
	if who == Black and mum == 4
		move << " Checkmate!"
	end
	true  	# Stub again - always say it's legal
end

def get_move(who, move, num, board)
	ok = false
	until ok do 
		print "\nYour move: "
		move = STDIN.gets.chomp
		ok = analyze_move(who, move, num, board)
		puts "Illegal move" unless ok
	end
	move
end
def my_move(who, lastmove, num, board, opponent, sock)
	move = get_move(who, lastmove, num, board)
	sock.puts move
	draw_board(board)

	case move
	when "resign"
		puts "\nYou've  resigned. #{opponent} wins. "
		true
	when /Checkmate/
		puts "\nYou have checkmated #{opponent}! "
	else
		false
	end
end

def other_move(who, move, num, board, opponent, sock)
	move = sock.gets.chomp
	puts "\nOpponent: #{move}"
	draw_board(board)

	case move
	when "resign"
		puts "\n#{opponent} has resigned... you win!"
		true
	when /Checkmate/
		puts "\n#{opponent} has checkmated you."
		true
	else
		false
	end
end

if ARGV[0]
	myself = ARGV[0]
else
	print "Your name? "
	myself = STDIN.gets.chomp
end

if ARGV[1]
	opponent_id = ARGV[1]
else
	print "Your opponent? "
	opponent_id = STDIN.gets.chomp
end
opponent = opponent_id.split(":")[0]
# Contact the server
socket = TCPSocket.new(ChessServer, ChessServerPort)
socket.flush
# sending msg to Server
socket.puts "login #{myself} #{opponent_id}"
# wait for responce from Server
response = socket.gets.chomp
name, ipname, color = response.split ":"
color = color.to_i
puts "#{name}, #{ipname}, #{color}."
if color == Black
	puts "\nConnecting..."
	server = TCPServer.new(PeerPort)
	session = server.accept
	begin
		timeout(30) do 
			str = session.gets.chomp
			if str != "ready"
				raise "Protocol error: ready-message was #{str}"
			end
		end
	rescue Timeout::Error 
		raise "Did not get ready-message from opponent."
	end

	puts "Playing #{opponent}... you are white.\n"

	who = White
	move = nil
	board = nil
	num = 0
	draw_board(board)

	loop do 
		num += 1
		won = my_move(who, move, num, board, opponent, session)
		break if won
		lost = other_move(who, move, num, board, opponent, session)
		break if  lost
	end
else
	puts "\nConnecting..."
	socket = TCPSocket.new(ipname, PeerPort)
	socket.puts "ready"
	puts "Playing #{opponent}... you are black.\n"

	who = Black
	move = nil
	board =  nil
	num = 0
	draw_board(board)

	loop do 
		num += 1
		lost = other_move(who, move, num, board, opponent, socket)
		break if lost
		won = my_move(who, move, num, board, opponent, socket)
		break if won
	end

	socket.close
end
