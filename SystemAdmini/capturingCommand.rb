puts <<-Exp
  The generalized delimiter %x calls the backquote operator(which is really
	a Kernel method). It works essentially the same way:
	The %x form is often useful when the string to be executed contains
	characters such as a single and double quotes.

Exp

listing = 'ls -l'
now = 'date'

listing = %x(ls -l)
now = %x(date)
puts listing
puts now

alias old_execute `

def `(cmd)
  out = old_execute(cmd)
	out.split("\n")
end
entries = `ls -l ./`
num = entries.size
puts "entries : #{entries}"

first3lines = %x(ls -l | head -n 3)
how_many = first3lines.size
puts how_many

def `(cmd)
  old_execute(cmd + " 2>&1")
end

entries = `ls -l ./`
puts "entries :\n #{entries}"


