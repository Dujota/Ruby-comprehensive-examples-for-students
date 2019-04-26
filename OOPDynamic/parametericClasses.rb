# p 400 11.2.4 Creating Parametric Classes

# class IntelligentLife
# 	def IntelligentLife.home_planet
# 		class_eval("@@home_planet")
# 	end
# 	def IntelligentLife.home_planet=(x)
# 		class_eval("@@home_planet = #{x}")
# 	end
# end
# class Terran < IntelligentLife
# 	@@home_planet = "Earth"
# end
# class Martian < IntelligentLife
# 	@@home_planet = "Mars"
# end
class IntelligentLife
	class << self
		attr_accessor :home_planet
	end
end
class Terran < IntelligentLife
	self.home_planet = "Earth"
end
class Martian < IntelligentLife
	self.home_planet = "Mars"
end
puts Terran.home_planet
puts Martian.home_planet
