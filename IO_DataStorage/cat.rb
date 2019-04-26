# Read all files, then output again
##puts ARGF.read
# Or more memory-efficient:
puts ARGF.readline until ARGF.eof?
# Example usage: ruby cat.rb file1 file2 file3

# Read a line from standard input
str1 = STDIN.gets
# Read a line from ARGF
str2 = ARGF.gets
# Now read again from standartd input
str3 = STDIN.gets


