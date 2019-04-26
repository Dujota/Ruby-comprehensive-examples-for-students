require 'complex'

# quadratic ax^2 + bx + c = 0 --> x=(-b + sqrt(b^2 - 4ac))/2
def quadratic(a, b, c, complex=false)
  raise ArgumentError unless [a,b,c].all? {|x| Numeric === x}
	discr = b * b - 4 * a * c
	if (discr > 0) || (complex && discr < 0)
		val = Math.sqrt(discr)
		r1 = (-b + val)/(2*a.to_f)
		r2 = (-b - val)/(2*a.to_f)
		return [r1,r2]
	elsif discr.zero?
	  r1 = -b/(2*a.to_f)
		return [r1]
	else
		return []
	end
end


