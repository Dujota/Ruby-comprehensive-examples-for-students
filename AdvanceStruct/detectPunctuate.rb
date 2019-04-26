require './stackStricter'

def paren_match(str)
  stack = Stack.new
  lsym = "{[(<"
  rsym = "}])>"
  str.each_char do |sym|
    if lsym.include? sym
	  stack.push(sym)
	elsif rsym.include? sym
	  top = stack.peek
	  if lsym.index(top) != rsym.index(sym)
		return false
	  else
	    stack.pop
	  end
	end
  end
  return stack.empty?
end

str1= "(((a+b))*((c-d)-(e*f))"
str2= "[[(a-(b-c))],[[x,y]]]"

puts "paren match #{str1} : #{paren_match(str1)}"
puts "paren match #{str2} : #{paren_match(str2)}"


