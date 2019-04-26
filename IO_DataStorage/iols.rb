cur = Dir.getwd
dir = Dir.new(cur)
dir.each {|entry| puts entry}

list = Dir.entries(cur)
p list,"\n"

rblist = Dir.glob("*.rb")
puts "Dir.glob(\"*.rb\") --> \n  #{rblist}"

puts "=== find check ==="
require "find"

def findfiles(dir, name)
  list = []
  Find.find(dir) do |path|
    Find.prune if [".",".."].include? path
	case name
	when String
	  list << path if File.basename(path) == name
	when Regexp
	  list << path if File.basename(path) =~ name
	else
	  raise ArgumentError
	end
  end
  list
end

cur = Dir.pwd
rblist = findfiles cur, "iols.rb"
puts rblist

rblist = findfiles cur, /^io/
puts rblist

