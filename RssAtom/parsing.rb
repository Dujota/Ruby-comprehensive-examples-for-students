#! /usr/local/bin/ruby -w
require 'rss'
require 'open-uri'
puts <<-Exp
=== Working with RSS(Really Simple Syndiaction) and Atom ===
  RS was standardized early on in the development of the Internet, and 
	different developers extended it with additional features in interesting ways. A parser may have great difficulty parsing.
  This inconvenience is even more true because there are 0.9,1.0 and 2.0.The RSS versions are something whose details you don't want to know unless you must.

Exp
puts <<-EOF
"=== Parsing Feeds ==="

EOF

xml = open("https://apod.nasa.gov/apod.rss").read
feed = RSS::Parser.parse(xml, false)

puts feed.channel.description
feed.items.each_with_index do |item, i|
	puts "#{i + 1}. #{item.title.strip}"
end

unless File.exist?("apod.rss")
	File.write("apod.rss", open("https://apod.nasa.gov/apod.rss").read)
end

xml = File.read("apod.rss")

#feed = RSS::Parser.parse(xml, false)
#puts feed.channel.description
#feed.items.each_with_index do |item, i|
#	puts "#{i + 1}. #{item.title.strip}"
#end


