pat = /(.+[aiu])(.+[aiu])(.+[aiu])(.+[aiu])/i
str = "Fujiyama"
refs = pat.match(str)
puts "refs = #{pat}.match(\"#{str}\") ---> "
x = refs[1]
y = refs[2..3]
puts "refs[0] = #{refs[0]}"
puts "refs[1] = #{x}"
puts "refs[2..3] = #{y}"
puts "refs.to_a.each  ----> "
refs.to_a.each {|x| print "#{x}\n"}

test2 = "(b[^ ]+ ) Test"
puts test2.center(40, "-")
str = "alpha beta gamma delta epsilon"
#      0....5....0....5....0....5....0
puts str
print "0....5...." * 3 , "\n"
pat = /(b[^ ]+ )(g[^ ]+ )(d[^ ]+ )/
puts pat
refs = pat.match(str)
p1 = refs.begin(1)
p2 = refs.end(1)
puts "beta begin(1): #{p1}, end(1): #{p2}"
p3 = refs.begin(2)
p4 = refs.end(2)
puts "gamma begin(2): #{p3}, end(2): #{p4}"
p5 = refs.begin(3)
p6 = refs.end(3)
puts "delta begin(3): #{p5}, end(3): #{p6}"
p7 = refs.begin(0)
p8 = refs.end(0)
puts "[0] beta gamma delta begin(0): #{p7}, end(0): #{p8}"

