#!/usr/bin/ruby -w
content = 'The Princess And The Monkey

Once upon a time there was a pricess...
...and they all lived happily ever after.

The End'

puts "Found it" if content =~ /^Once upon a time/
puts "2Found it" if content =~ /happily ever after\.$/
