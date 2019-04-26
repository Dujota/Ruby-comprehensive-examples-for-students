document = <<-EOF
================================================
Marshal data:
 We want to store specific data for later, rather than simply write bytes to
 file. In order to do this, we convert data from objects into bytes and back again, a process called serialization. 
================================================
EOF
puts document
# array of elements [composer, work, minute]
works = [["Leonard Bernstein", "Overture to Candide", 11],
		["Aaron Copland", "Symphony No. 3", 45],
		["Jean Sibelius", "Finlandia", 20]]
# We want to keep this for later...
dat = Marshal.dump(works)   # works --> Marshal.dump file
File.write("store", dat)	# save dat in "store" file
puts dat
# Much later
works = Marshal.load(File.read("store"))

puts works

dat2 = Marshal.dump("foo").bytes[0..1]
p dat2

puts <<-EOF
Deep copying: Using dup or clone on, a hash will not copy the keys and
values that the hash references.
  def deep_copy(obj)
    Marshal.load Marshal.dump(obj)
  end

  a = deep_copy(b)

EOF

