require 'drb'
require 'drb/ssl'

SERVER_URI = "druby://192.168.2.16:61676"
config = {
	:SSLVerifyMode => OpenSSL::SSL::VERIFY_PEER,
	:SSLCACertificateFile => "CA/cacert.pem",
}

DRb.start_service(nil, nil, config)
server = DRbObject.new_with_uri("drbssl://192.168.2.16:61676")

puts server.say_hello