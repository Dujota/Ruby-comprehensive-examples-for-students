str = <<-EOF
	When in the Course of human events it becomes necessary
	for one people to dissolve the plitical bands which have
	connected them with another, and to assume among the powers
	of the earth the separate and equal station to which the Laws
	of Nature and of Nature's God entitle them, a decent respect
	for the opinions of mankind requires that they should declare
	the causes which impel them to the separation.
	EOF

max = 30

line = 0
out = [""]

input = str.gsub(/\n/, " ")
words = input.split(" ")
while input != ""
	word = words.shift
	break if not word
	if out[line].length + word.length > max 
		out[line].squeeze!(" ")
		line += 1
		out[line] = ""
	end
	out[line] << word + " "
end
puts str
puts "----- Wrapping for < #{max} ----"
out.each {|line| puts line}
