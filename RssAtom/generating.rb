#! /usr/local/bin/ruby -w
require 'rss'

feed = RSS::Maker.make('atom') do |f|
	f.channel.title = "Feed Your Head"
	f.channel.id = "http://nosuchplace.org/home/"
	f.channel.author = "Y.T."
	f.channel.logo = "http://nosuchplace.org/images/headshot.jpg"
	f.channel.updated = Time.now

	f.items.new_item do |i|
		i.title = "Once again, here we are"
		i.link = "http://nosuchplace.org/articles/once_again/"
		i.description = "Don't you feel more like you do now than usual?"
		i.updated = Time.parse("2017-04-05 10:56AM")
	end
	f.items.new_item do |i|
		i.title = "So long, and thanks for all the fiche"
		i.link = "http://nosuchplace.org/articles/so_long_and_thanks/"
		i.description = "I really miss the days of microfilm..."
		i.updated = Time.parse("2017-04-01 00:00AM")
	end
end

puts feed.to_xml
