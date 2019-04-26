#! /usr/bin/ruby -w
code = <<EOF
$s1 = "abracadabra"
$a = $s1.count("c")
$b = $s1.count("bdr")
$c = $s1.count("^a")
$d = $s1.count("^bdr")
$e = $s1.count("a-d")
$f = $s1.count("^a-d")
EOF
puts code
eval(code)
puts "\"#{$s1}\"(#{$s1.size})"
puts "(\"c\"):#{$a}, (\"bdr\"):#{$b},(\"^a\"):#{$c}, (\"^bdr\"):#{$d}"
puts "(\"a-d\"):#{$e}, (\"^a-d\"):#{$f}"

