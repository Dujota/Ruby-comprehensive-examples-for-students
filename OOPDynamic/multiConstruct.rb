# listing 11.1 p363 of RubyWay
class ColorRectangle
	def initialize(r, g, b, s1,s2)
		@r, @g, @b, @s1, @s2 = r, g, b, s1, s2
	end
	def self.white_rect(s1,s2)
		new(0xff, 0xff, 0xff, s1, s2)
	end
	def self.gray_rect(s1,s2)
		new(0x88,0x88,0x88, s1, s2)
	end
	def self.colored_square(r,g,b,s)
		new(r,g,b,s,s)
	end
	def self.red_square(s)
		new(0xff,0,0,s,s)
	end
	def inspect
		"#@r, #@g, #@b, #@s1, #@s2"
	end
end

code = "  $a = ColorRectangle.new(0x88,0xaa,0xff, 20,30)"
puts code
eval code
puts "   ---> $a.inspect = #{$a.inspect}"

code = "  $b = ColorRectangle.white_rect(15,25)"
puts code
eval code
puts "   ---> $b.inspect = #{$b.inspect}"

code = "  $c = ColorRectangle.red_square(40)"
puts code
eval code
puts "   ---> $c.inspect = #{$c.inspect}"
