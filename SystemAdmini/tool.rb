puts <<EOF
==== Parsing Command-Line Options ====
  Ruby provides the "OptionParser" library. Essentially, OptionParser gives 
	you a simple domain-specific language(DSL) for describing just how you 
	want the arguments to your program parsed.
     ruby tool.rb -h
		 ruby tool.rb -f tool.rb
		 ruby tool.rb -f tool.rb -l 10 print

EOF

require 'optparse'

args = {lines: 100}

OptionParser.new do |opts|
  opts.banner = "Usage: tool [options] COMMAND"

	#opts.on("-f", "-file FILE") do |file|
	opts.on("--file FILE","-f") do |file|
	  args[:file] = file
	end

	opts.on("--lines [LINES]", "-l",Integer,
	   "Number of lines to output (default 100)"
	) do |lines|
	  args[:lines] = lines
	end

	#opts.on_tail("-h", "-help", "Show this help") do 
	opts.on_tail( "--help", "-h","Show this help") do 
	  puts opts
		exit
	end
end.parse!

p args
p ARGV.first

