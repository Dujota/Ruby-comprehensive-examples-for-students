arr = (1..10).to_a
puts "arr = #{arr}"
code1 = <<-END 
arr.each_slice(3) do |triple|
  puts triple.join(",")
end
END
puts code1
arr.each_slice(3) do |triple|
  puts triple.join(",")
end

code2 = <<-END 
arr.each_cons(3) do |triple|
  puts triple.join(",")
end
END
puts code2
arr.each_cons(3) do |triple|
  puts triple.join(",")
end

