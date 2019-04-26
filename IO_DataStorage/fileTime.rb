filename = "sample.txt"
t1 = File.mtime(filename)
puts "File.mtime<Modify> : #{t1}"
t2 = File.atime(filename)
puts "File.atime<Access> : #{t2}"
t3 = File.ctime(filename)
puts "File.ctime<Change> : #{t3}"

altcode = <<-EOF
myfile = File.new(filename)
t1 = myfile.mtime;t2 = myfile.atime;t3 = myfile.ctime
EOF
puts altcode

today = Time.now
# Modification time might be changed using the "utime" method
# File.utime(today, today, "alpha")
# File.utime(today, yesterday, "beta". "gamma")
#   mtime = File.mtime(filename)
#   File.utime(Time.now, mtime, filename)

