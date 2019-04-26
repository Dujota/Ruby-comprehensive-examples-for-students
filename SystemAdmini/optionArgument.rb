n = ARGV.size
argstr = %{"#{ARGV * ', '}"}
puts "I was given #{n} argments..."
puts "They are: #{argstr}"
puts "Note that ARGV[0] = #{ARGV[0]}"

