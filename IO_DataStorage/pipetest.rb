#check = IO.popen("spell","r")
#check.puts(

f = IO.popen("uname")
p f.readlines
f.close

puts "Parent is #{Process.pid}"

IO.popen("date") {|f| puts f.gets}

IO.popen("-") {|f| $stderr.puts "#{Process.pid} is here; f:#{f.inspect}"}
p $?

IO.popen("-") do |mypipe|
  if mypipe
	puts "I'm the parent: pid = #{Process.pid}"
	listen = mypipe.gets
	puts listen
  else
	puts "I'm the child: pid = #{Process.pid}"
  end
end

pipe = IO.pipe
reader = pipe[0]
writer = pipe[1]

str = nil
thread1 = Thread.new(reader,writer) do |reader,writer|
  # writer.close_write
  str = reader.gets
  reader.close
end
thread2 = Thread.new(reader, writer) do |reader, writer|
  # reader.close_read
  writer.puts("What hath God wrought?")
  writer.close
end

thread1.join
thread2.join

puts str

