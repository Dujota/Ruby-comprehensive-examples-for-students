# 11.1.4 Creating Class-Level Attributes and Methods
# Listing 11.3 P369 Class Variables and Methods

class Metal
  @@current_temp = 76

  attr_accessor :atomic_number,:melting

  def self.current_temp=(x)
  	@@current_temp = x
  end
  def self.current_temp
  	@@current_temp
  end
  def liquid?
  	if @@current_temp >= @melting 
	  	"temp #{@@current_temp} Over  #{@melting}, so Liquid"
	  else
	  	"temp #{@@current_temp} Under #{@melting}, so Solid"
	  end
  	#@@current_temp >= @melting 
  end
  def initialize(atnum, melt)
  	@atomic_number = atnum
  	@melting = melt
  end
end

aluminum = Metal.new(13, 1236)
copper   = Metal.new(29, 1982)
gold     = Metal.new(79, 1948)

code = 'Metal.current_temp = 1600'
puts code; eval(code)

puts "Aluminum melting point - #{aluminum.melting}"
puts aluminum.liquid? 
puts copper.liquid?
puts gold.liquid?

code = 'Metal.current_temp = 2100'
puts code; eval(code)
puts aluminum.liquid? 
puts copper.liquid?
puts gold.liquid?



