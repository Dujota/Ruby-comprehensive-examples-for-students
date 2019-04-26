
def func1
  puts caller[0]
end
def func2
  func1
end

func2

def a(skip)
  caller(skip)
end
def b(skip)
  a(skip)
end
def c(skip)
  b(skip)
end

puts "c(0) -> #{c(0)}"
puts "c(1) -> #{c(1)}"
puts "c(2) -> #{c(2)}"
puts "c(3) -> #{c(3)}"
puts "c(4) -> #{c(4)}"
puts "c(5) -> #{c(5)}"

