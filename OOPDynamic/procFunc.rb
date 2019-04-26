# p 404 11.2.5 Stroing Code at Proc Objects

test =["=== 1. Proc.new and .call(x)",
       "=== 2. &block as a argument Proc",
       "=== 3. execute &block",
       "=== 4. passing through  &block"
	]
puts test[0]
code1 = <<-EOF
  local = 12
  myproc = Proc.new {|a| $result = a * local }
  local = 33
  myproc.call(99)        # 99 --> |a|
EOF
puts code1
eval(code1)
puts "    --> $result = #{$result}"
gets

# a method defined with a trailing & parameter is called with a block
# puts "Proc objects are created automatically when a method defined with"
# puts "a trailing & parameter is called with a block:"
puts test[1]
code = <<-EOF
  def take_block(x, &block)
    x.times {|i| block[i, i*i]}
  end
  take_block(3) { |n,s| puts n.to_s + " squared is " + s.to_s }
EOF
puts code
print "    --->";eval(code)
gets

puts test[2]
code = <<-EOF
  myproc = proc {|n| print n, "... "}
  (1..3).each(&myproc)
EOF
puts code
print "    --->";eval(code)
puts
gets

puts test[3]
#testmesg5 =<<EOF
#  def greet(&block)
#    block.call
#    "Good morning, everyone."
#  end
#EOF
#puts testmesg5
code = <<-EOF
  def greet(&block)
    block.call
    "Good morning, everyone."
  end

  philippe_proc = Proc.new { return "Too soon, Philippe!"}
  philippe_lambda = lambda { return "Too soon, Philippe!"}

  p greet(&philippe_proc)		# -> Too soon, Philippe!
  p greet(&philippe_lambda)	# -> Good morning, everyone.
EOF
puts code
eval(code)

