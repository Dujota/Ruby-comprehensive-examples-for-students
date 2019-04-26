document = <<-EOF
# 1. define in the class
  class Address
	  attr_accessor :street, :city, :state
	  def initialize(street, city, state)
		  @street, @city, @state = street, city, state
	  end
  end
  books = Address.new("411 Elm St", "Dallas", "TX")

# 2. simplely use Struct  Struct.new("class name", :memeber1...)
  Address2 = Struct.new("Address2", :street, :city, :state)
  books = Address2.new("411 Elm St", "Dallas", "TX")

# 3. use Struct and different way 
  Struct.new("Address3", :street, :city, :state)
  books = Struct::Address3.new("411 Elm St", "Dallas", "TX")

EOF
puts document
# 1. define in the class
class Address
	attr_accessor :street, :city, :state
	def initialize(street, city, state)
		@street, @city, @state = street, city, state
	end
end
books = Address.new("411 Elm St", "Dallas", "TX")
puts "Case 1 --#{books.inspect}"

# 2. simplely use Struct  Struct.new("class name", :memeber1...)
Address2 = Struct.new("Address2", :street, :city, :state)
books = Address2.new("411 Elm St", "Dallas", "TX")
puts "Case 2 --#{books.inspect}"

# 3. use Struct and different way 
Struct.new("Address3", :street, :city, :state)
books = Struct::Address3.new("411 Elm St", "Dallas", "TX")
puts "Case 3 --#{books.inspect}"


# p391 11.1.15 Freezing Objects
str = "This is a test. "
str.freeze

begin 
	str << " Don't be alarmed."
rescue => err
	puts "#{err.class} #{err}"
end

arr = [1,2,3]
arr.freeze
begin
	arr << 4
rescue => err
	puts "#{err.class} #{err}"
end

