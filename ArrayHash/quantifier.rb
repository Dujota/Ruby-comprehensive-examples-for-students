nums = [1,3,5,8,9]
# Are any of these numbers even?
flag1 = nums.any? {|x| x%2 == 0}
puts flag1
flag2 = nums.all? {|x| x % 2 == 0}
puts flag2
