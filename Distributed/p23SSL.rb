require 'drb'
require 'drb/ssl'

# Make sure no one can call eval() and related methods remotely!
$SAFE = 1

URI = "druby://192.168.2.16:61676"
class HelloWorldServer
	def say_hello
		"Hello, world!"
	end
end
config = {
	:SSLPrivateKey =>
		OpenSSL::PKey::RSA.new(
			File.read("hello-server/hello-server_keypair.pem")
		),
	:SSLCertificate =>
		OpenSSL::X509::Certificate.new(
			File.read("hello-server/cert_hello-server.pem")
		),
}


DRb.start_service(URI, HelloWorldServer.new, config)
DRb.thread.join
	