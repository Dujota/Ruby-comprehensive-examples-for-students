puts "=== Extracting Hashes with Block ==="
names = {"fred" => "jones", "jane" => "tucker", 
			"joe" => "tuchker", "mary" => "SMITH"}
puts "names=#{names}"
exe1 = 'names.detect {|k,v| v == "tucker"}'
puts "  #{exe1} --> #{eval(exe1)}"

exe2 = 'names.find {|k,v| v == v.upcase}'
puts "  #{exe2} --> #{eval(exe2)}"
exe3 = 'names.select {|k,v| v == "tucker"}'
puts "  #{exe3} --> #{eval(exe3)}"
exe4 = 'names.find_all {|k,v| k.count("r") > 0}'
puts "  #{exe4} \n                     --> #{eval(exe4)}"

puts "=== Extracting Hashes with Block ==="
names = {"Jack" => "Ruby", "Monty" => "Python",
			"Blaise" => "Pascal", "Minnie" => "Perl"}
list = names.sort
puts "names = #{names}"
puts "  list = names.sort\n       --> #{list}"
puts "  list.to_h --> #{list.to_h}"
