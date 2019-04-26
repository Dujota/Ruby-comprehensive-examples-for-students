require 'socket'
require 'time'

resp = TCPSocket.new("time.nist.gov", 13).read
puts resp.inspect

time = resp.split(" ")[2] + " UTC"
puts time
remote = Time.parse(time)

puts "Local : #{Time.now.utc.strftime("%H:%M:%S")}"
puts "Remote: #{remote.strftime("%H:%M:%S")}"

