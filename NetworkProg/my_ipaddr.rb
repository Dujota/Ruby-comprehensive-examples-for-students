require 'socket'
# ダミーのUDPソケットを作り、それを相手ホストにconnect()し、
# getsockname()で自分のアドレスを得る。connectのMANPAGEによると、
# UDPソケットをconnectすると、特に何もパケットが送出されることはなく、
# そのソケットのデフォルトのパケット送信先/唯一の受診先となる、
# という仕様がある 

def my_ipaddr
  udp = UDPSocket.new
	udp.connect("128.0.0.0", 7)
	adrs = Socket.unpack_sockaddr_in(udp.getsockname)[1]
	udp.close
	adrs
end


