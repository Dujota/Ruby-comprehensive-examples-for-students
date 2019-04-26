#!/usr/bin/ruby -w

def towers(list)
  while !list.empty?
	print "pop:" , list.last, "\n"
	n, src, dst, aux = list.pop
	if n == 1
	  puts "     Move disk from #{src} to #{dst}"
	else
	  list.push [n-1, aux, dst, src]
	  print "                    #{list.last}\n"
	  list.push [1, src, dst, aux]
	  print "                    #{list.last}\n"
	  list.push [n-1, src, aux, dst]
	  print "                    #{list.last}\n"
	end
  end
end

list =[]
list.push([3, "a", "c", "b"])
	  p list.last

towers(list)


