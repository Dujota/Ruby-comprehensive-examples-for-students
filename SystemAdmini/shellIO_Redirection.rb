require 'shell'

#sh1 = Shell.new        # Work in the current directory
#sh2 = Shell.cd("../")  # Work in ../

sh = Shell.new

# Print the readme.txt file to stdout
sh.cat("shellIO_Redirection.rb") > STDOUT

# Print it again
(sh.cat < "shellIO_Redirection.rb") > STDOUT
(sh.echo "This is a test") > "myfile.txt"

# Cat two files to stdout, tee-ing to a third
#(sh.cat "myfile.txt", "shellIO_Redirection.rb") | (sh.tee "file3.txt") > STDOUT

puts <<-EOF
Ruby parser understands these
  1. sh.cat("readme.txt") > STDOUT
  2. (sh.cat "readme.txt") > STDOUT
  3. sh.cat "readme.txt" > STDOUT

EOF
