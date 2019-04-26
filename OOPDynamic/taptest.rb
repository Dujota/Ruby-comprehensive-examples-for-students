# tap means the following code
# class Object
#   def tap
#     yield(self)
#     self
#   end
# end
#  ブロックにselfを渡してselfを返すmethod
#  tapは「盗聴」という意味なのでobjectの中身を除き見るもの


(1..5)
.tap {|obj| puts obj.class}
.to_a.tap {|obj| puts obj.class}

def fizzbuzz(n)
  ret = ""
  ret << "Fizz" if n % 3 == 0
  ret << "Buzz" if n % 5 == 0
  ret.empty? ? n : ret
end

def fizzbuzz(n)
  "".tap do |ret|
    ret << "Fizz" if n % 3 == 0
	ret << "Buzz" if n % 5 == 0
	break n if ret.empty?
  end
end

