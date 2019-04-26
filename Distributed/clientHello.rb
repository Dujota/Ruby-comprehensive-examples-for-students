require 'drb'
#URI_IP = "190.168.2.190"
URI_IP = "10.2.160.92"
#URI_IP = 'localhost'

# server = DRbObject.new_with_uri("druby://127.0.0.1:61676")
# puts server.say_hello
puts <<-EOF
#logger = DRbObject.new_with_uri("druby://127.0.0.1:61676")
#logger.info "Hello, world! from Client"
hello = DRbObject.new_with_uri("druby://#{URI_IP}:61676")
puts hello.say_hello
EOF

#logger = DRbObject.new_with_uri("druby://127.0.0.1:61676")
#logger.info "Hello, world! from Client"
hello = DRbObject.new_with_uri("druby://#{URI_IP}:61676")
puts hello.say_hello
