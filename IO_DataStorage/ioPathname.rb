str = "/Users/Mikio/test/rubytest/Rules/IO_DataStorage/sample.txt"
#str = "./sample.txt"
dir = File.dirname(str)
file1 = File.basename(str)
file2 = File.basename(str, ".txt")
puts "str=#{str}"
puts "File.dirname(str)  -> #{dir}"
puts "File.basename(str) -> #{file1}"
puts "File.basename(str,\".txt\") -> #{file2}"
puts "File.extname(str) -> #{File.extname(str)}"
puts "File.split(str)    -> #{File.split(str)}"

DOC = <<-EOF
Note: This is not extracted from real path and is handling strings.
      dirname, basename pick up the chars from just string.
EOF
puts DOC

current = Dir.pwd
puts "Dir.pwd<current>: #{current}"

Dir.chdir("/Users/Mikio/test/rubytest")
#Dir.chdir("~/test/rubytest")
abs = File.expand_path("../../researchRDoc")
puts abs
abs = File.expand_path("researchRDoc","/Users/Mikio")
puts abs




