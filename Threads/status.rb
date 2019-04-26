t1 = Thread.new {loop{}}
t2 = Thread.new{sleep 5}
t3 = Thread.new { Thread.stop}
t4 = Thread.new { Thread.exit }
t5 = Thread.new { raise "exception"}

sleep 1

s1 = t1.status
s2 = t2.status
s3 = t3.status
s4 = t4.status
s5 = t5.status
puts "{loop{}}  s1: #{s1}"
puts "{sleep 5} s2: #{s2}"
puts "{Thread.stop} s3: #{s3}"
puts "{Thread.exit} s4: #{s4}"
puts "{raise 'exception'}s5: #{s5}"

