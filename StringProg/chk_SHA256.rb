require 'digest'

str1 = Digest::SHA256.hexdigest("foo")[0..20]
puts "(" + str1.size.to_s + ") - " + str1
str2 = Digest::SHA256.base64digest("foo")[0..20]
puts str2

