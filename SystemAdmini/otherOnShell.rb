require 'shell'

puts <<-EXP
==== transact method ====
  The transact method will execute a block in the context of the shell instance.

EXP

puts <<-CODE
sh = Shell.new
sh.transact do 
  echo("A line of data") > "somefile.txt"
  cat("somefile.txt", "otherfile.txt") > "thirdfile"
  cat("thirdfile") | tee("file4") > STDOUT
end
CODE

puts <<-EXP
==== foreach method ====
  The foreach will take either a file or a directory as a parameter. If it is a file, it will iterate over the lines of that file; if it is a directory, it will iterate over the flenames in that directory. 

EXP

sh = Shell.new
# List all lines in 
sh.foreach("../") {|l| puts l }
# List all files in ../
sh.foreach("./") {|f| puts f}

puts <<-EXP
==== pushdir and popd method ====
  The pushdir and popd  methods will save and restore the current directory, respectively. Aliases are pushed and popd. The method pwd will determine the current working directory; 

  sh = Shell.cd "/home"

  puts sh.pwd
	sh.psuhd "/tmp"
	puts sh.pwd

	sh.popd
	puts sh.pwd

	sh = Shell.new
	flag1 = sh.exist? "myfile"
	sh.delete "somefile"

EXP


