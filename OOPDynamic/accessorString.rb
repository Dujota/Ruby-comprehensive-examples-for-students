# p398 Listing 11.10 A Class-Level Method accessor_string
puts <<-EOF
  Make def function with class_eval
    class_eval <<-END
      def \#{name}
        @\#{name}.to_s
      end	
    END	
EOF
class MyClass
	class << self
		def accessor_string(*names)
			names.each do |name| 
				class_eval <<-EOF
					def #{name}
						@#{name}.to_s
					end
				EOF
			end
		end
	end
	def initialize
		@a = [1,2,3]
		@b = Time.now
	end

	accessor_string :a, :b		# accessor_string(:a, :b) -> make defs
end

o = MyClass.new
puts o.a
puts o.b

module Quantifier
	def two?
		2 == self.select {|x| yield x}.size
	end
	def four?
		4 == self.select {|x| yield x}.size
	end
end

list = [1,2,3,4,5]
list.extend(Quantifier)
flag1 = list.two? {|x| x > 3}
flag2 = list.two? {|x| x >= 3}
flag3 = list.four? {|x| x <= 4}
flag4 = list.four? {|x| x % 2 == 0}

puts flag1
puts flag2
puts flag3
puts flag4

