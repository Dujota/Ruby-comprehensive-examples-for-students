theme1 = " Remove, Duplicate Char "
puts theme1.center(40, "=") 
s1 = "bookkeeper"
s2 = s1.squeeze
puts "\"" + s1 + "\"" + ".squeeze --> " + "\"" + s2 + "\""
s3 = "Hello..."
puts "\"" + s3 + "\"" + ".squeeze --> " + "\"" + s3.squeeze + "\""
s3 = "Hello..."
puts "\"" + s3 + "\"" + ".squeeze(\".\") --> " + "\"" + s3.squeeze(".") + "\""
puts

theme2 = " Remove Specific Char "
puts theme2.center(40, "=") 
s1 = "To be, or not to be"
puts "\"" + s1 + "\"" + ".delete(\"b\") --> " + "\"" + s1.delete("b") + "\""
s1 = "Veni, vidi, vici!"
puts "\"" + s1 + "\"" + ".delete(\",!\") --> " + "\"" + s1.delete(",!") + "\""
puts



theme3 = "Printing Special Char"
puts theme3.center(40, "=") 
s1 = "Listen" << "\007\007\007"
puts "\""+ "Listen\\007\\007\\007" + "\""+ ".dump ---> " + s1.dump
s2 = "abc\t\tdef\tghi\n\n"
puts "\""+ "abc\\t\\tdef\\tghi\\n\\n" + "\""+ ".dump ---> " + s2.dump
puts

theme4 = " Generating Successive String"
puts theme4.center(40, "=") 
s1 = "R2D2"
puts "\""+ s1 + "\""+ ".succ ---> " + s1.succ
pill = "Vitamin B"
puts "\""+ pill + "\""+ ".succ ---> " + pill.succ
code = '"Files, B".upto("Files, E")  { |letter| print " \"#{letter}\","}'
print code + "\n      ---> "
eval(code)
puts



