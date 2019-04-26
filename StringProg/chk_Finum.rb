#! /usr/bin/ruby -w
##  
# #{} can include method
str = "The answer is #{
		def factorial(n)
		  n == 0 ? 1 : n*factorial(n - 1)	
		end
		answer = factorial(3) * 7
}, of course."
puts str

##
# Delayed Interpolation of Strings
##str = "#{name} is my name, and #{nation} is my nation."
str = '#{name} is my name, and #{nation} is my nation.'
name, nation = "Mikio", "Japanese"
s1 = eval('"'+ str+ '"')
puts s1

str = proc do |name, nation|
	"#{name} is my name, and #{nation} is my nation."
end
s2 = str.call("Gulliver Foyle", "Terra")
puts s2

samplecode = <<-EOF
  $x = Integer("0b111")
  $y = Integer("0111")
  $z = Integer("0x111")
	EOF
eval(samplecode)
puts samplecode + "--- $x=#{$x}, $y=#{$y},$z=#{$z}"

samplecode = <<-EOF
  $x = "111".to_i(2)
  $y = "111".to_i(8)
  $z = "111".to_i(16)
	EOF
eval(samplecode)
puts samplecode + "--- $x=#{$x}, $y=#{$y},$z=#{$z}"

samplecode = <<-EOF
  require "scanf"
  str = "234 234 234"
  $x, $y, $z = str.scanf("%d %o %x")
	EOF
puts samplecode
eval(samplecode)
puts "--- $x=#{$x}, $y=#{$y},$z=#{$z}"

