days = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
puts "days=#{days}"
puts "days.count  =  #{days.count}"
puts "days.count(\"Saturday\")  =  #{days.count("Saturday")}"
puts "days.count {|x| x.length == 6}  =  #{days.count {|x| x.length == 6}}"

puts "days.minmax  :  #{days.minmax}"
puts "days.min_by {|x| x.length}     :  #{days.min_by {|x| x.length}}"
puts "days.max_by {|x| x.length}     :  #{days.max_by {|x| x.length}}"
puts "days.minmax_by {|x| x.reverse} :  #{days.minmax_by {|x| x.reverse}}"

