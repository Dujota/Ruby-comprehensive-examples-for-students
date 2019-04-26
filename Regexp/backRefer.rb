str = "a123b45c678"
puts "\"#{str}\""
pattern = /(a\d+)(b\d+)(c\d+)/
puts pattern
if pattern =~ str
	puts "Matches are: $1:'#$1', $2:'#$2', $3:'#$3' "
end

s2 = "1st=#$1, 2nd=#$2, 3rd=#$3"
puts str.sub(pattern, s2)
 
