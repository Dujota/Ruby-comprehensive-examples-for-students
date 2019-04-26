puts <<-EXP
lines = File.open(filename) {|f| f.readlines}
# Manipulate as needed
lines.each {|x| puts x}
# at a time
File.open(filename) do |file| 
  file.each_line do |line|
    puts line
  end
end
EXP

puts "=== copying a Directory Tree ==="
require 'fileutils'

def recurse(src,dst)
  Dir.mkdir(dst)
	Dir.foreach(src) do |e|
	  # Don't bother with . and ..
		next if [".",".."].include? e
		fullname = src + "/" + e
		newname = fullname.sub(Regexp.new(Regexp.escape(src)), dst)
		if File.directory?(fullname)
			recurse(fullname, newname)
		elsif File.symlink?(fullname)
		  linkname = 'ls -l #{fullname}'.sub(/.* -> /, "").chomp
			newlink = linkname.dup
			n = newlink.index($oldname)
			next if n == nil
			n2 = n + $oldname.length - 1
			newlink[n..n2] = $newname
			newlink.sub!(/\/\//, "/")
			newlink = linkname.sub(Regexp.new(Regexp.escape(src)), dst)
			File.symlink(newlink, newname)
		elsif File.file?(fullname)
		  FileUtils.copy(fullname, newname)
		else
			puts "??? : #{fullname}"
		end
	end
end

if ARGV.size != 2
  puts "Usave: copytree oldname newname"
	exit
end

oldname = ARGV[0]
newname = ARGV[1]

if !File.directory?(oldname)
	puts "Error: First parameter must be an existing directory."
  exit
end

if File.exist?(newname)
	puts "Error: #{newname} already exists."
  exit
end

oldname = File.expand_path(oldname)
newname = File.expand_path(newname)

$oldname=oldname
$newname=newname

recurse(oldname, newname)

