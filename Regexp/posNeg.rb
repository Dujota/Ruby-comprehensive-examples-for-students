s1 = "New World Dictionary"
s2 = "New World Symphony"
s3 = "New World Order"

reg = /New World(?= Dictionary| Symphony)/
m1 = reg.match(s1)
puts m1.class
puts m1.to_a[0]
m2 = reg.match(s2)
puts m2.to_a[0]
m3 = reg.match(s3)
puts m3

reg2 = /New World(?! Symphony)/
m1 = reg2.match(s1)
puts m1.to_a[0]
m2 = reg2.match(s2)
puts m2.to_a[0]
m3 = reg2.match(s3)
puts m3.to_a[0]

test2 = "Positive and Negative Lookbehind"
puts test2.center(50,"-")

gene = 'GATTACAAACTGCCTGACATACGAA'
segs = gene.scan(/T(\w{4})/)
puts segs

text = <<-EOF
<body> <h1>This is a heading</h1>
<p> This is a paragraph with some
<i>italics</i> and some <b>boldface</b>
in it...</p>
</body>
EOF

pattern = /(?:^|
				(?<=>)
				)
				([^<]*)
				/x

puts text.gsub(pattern) {|s| s.upcase }


