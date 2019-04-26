#!/usr/bin/ruby -w
require './levenshtein'

s1 = "ACUGAUGUGA"
s2 = "AUGGAA"
d1 = s1.levenshtein(s2)
puts "distance of \"#{s1}\" and \"#{s2}\" --> #{d1}"

s1 = "pennsylvania"
s2 = "pencilvaneya"
d1 = s1.levenshtein(s2)
puts "distance of \"#{s1}\" and \"#{s2}\" --> #{d1}"

s1 = "abcd"
s2 = "abcd"
d1 = s1.levenshtein(s2)
puts "distance of \"#{s1}\" and \"#{s2}\" --> #{d1}"

s1 = "polarity"
s2 = "hilarity"

if s1.similar?(s2, 3)
	puts "\"#{s1}\" and \"#{s2}\" " + "are similar"
else
	puts "\"" + s1 + "\"" + "and" +"\"" + s2 + "\"" + " are different"
end
d1 = s1.levenshtein(s2)
puts "distance of \"#{s1}\" and \"#{s2}\" --> #{d1}"

