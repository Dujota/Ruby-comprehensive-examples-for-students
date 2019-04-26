diskfile = File.new("foofile.txt","w")
puts "Hello.."
$stdout = diskfile
puts "Goodbye!"
diskfile.close
$stdout = STDOUT
puts "That's all."

