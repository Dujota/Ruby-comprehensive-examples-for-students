# 11.1.4 Creating Class-Level Attributes and Methods
# Listing 11.4 P371 Class Variables and Methods

class MyClass
  SOME_CONST = "alpha"
  @@var = "beta"
  @var =  "gamma"

  def initialize
    @var = "delta"
  end
  def mymethod
    puts SOME_CONST
    puts @@var
    puts @var
  end
  def self.classmeth1
    puts SOME_CONST
    puts @@var
    puts @var
  end
end

def MyClass.classmeth2
  puts MyClass::SOME_CONST
  # puts @@var
  puts @var
end
# class MyClass
#   def self.classmeth2
#     puts MyClass::SOME_CONST
#     puts @@var
#     puts @var
#   end
# end

myobj = MyClass.new
MyClass.classmeth1
puts
MyClass.classmeth2
puts
myobj.mymethod
