#!/usr/bin/ruby -w

def towers(n, src, dst, aux)
  puts "#{n}, #{src}, #{dst}, #{aux}"
  if n == 1
	puts "  Move disk from #{src} to #{dst}"
  else
	towers(n - 1, src, aux, dst)  # a --> b
	towers(1,     src, dst, aux)  # a --> c
	towers(n - 1, aux, dst, src)  # b --> c
  end
end

towers(3, "a", "c", "b")


