# p406 11.2.7 Using Symbols as Blocks

class Symbol
	def to_proc
		Proc.new {|obj| obj.send(self)}
	end
end

# which allows map to be invoked like this:
p1 = %w[A B C].map(&:chr)
p p1
