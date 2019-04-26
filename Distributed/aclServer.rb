require 'drb'
# require 'user'
require 'drb/acl'

# Make sure no one can call eval() and related methods remotely!
$SAFE = 1

class User
	include DRbUndumped

	attr_accessor :id
	attr_accessor :username

	def save
		"Saved: <#{self.id}: username: #{self.username}>"
	end
end
URI = "druby://192.168.2.190:61676"
class UserServer
	attr_accessor :users
	def initialize
		self.users = []
		5.times do |i|
			user = User.new
			user.id = i + 1
			user.username = "user#{i+1}"
			self.users << user
		end
	end
	def find(id)
		self.users[id - 1]
	end

end

acl = ACL.new(%w{deny all allow 192.168.2.202})
DRb.install_acl(acl)

DRb.start_service(URI, UserServer.new)
DRb.thread.join
	
