require 'set'

numbers = Set[1,2,3,4,5,6,7,8,9,0]
set = numbers.divide{|i| i % 2}
p set
p set.class

primes = Set[2,3,5,7,11,13,17,19,23,29,31]
set = primes.divide{|i,j| (i -j).abs == 2}
p set

