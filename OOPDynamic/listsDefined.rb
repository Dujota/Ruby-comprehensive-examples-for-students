list = Array.ancestors
puts "Array.ancestors -> #{list}"

list = Math.constants
puts "Math.constants -> #{list}"

class Parent
  @@var1 = nil
end
class Child < Parent
  @@var2 = nil
end

list1 = Parent.class_variables
list2 = Array.included_modules
p list1
p list2
