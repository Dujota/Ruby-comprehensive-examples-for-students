test1 = "set $1 for previous one \\1"
puts test1.center(50, "-")
rel = /\s+(\w+)\s+\1\s+/

str = "Now is the the time for all..."
arr = rel.match(str).to_a
puts "arr[0]: #{arr[0]},arr[1]: #{arr[1]}"

test2 = "set key in the regex data"
puts test2.center(50, "-")
str = "My hovercarft is full of eels."
reg = /My (?<noun>\w+) is (?<predicate>.*)/
m = reg.match(str)
puts "#{reg}.match(\"#{str}\")"
puts "m[:noun] --> #{m[:noun]}"
puts "m[\"predicate\"] --> #{m["predicate"]}"

