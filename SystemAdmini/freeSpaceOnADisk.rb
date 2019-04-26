
def freespace(device='.')
  lines = %x(df -k #{device}).split("\n")
	n = (lines.last.split[3].to_f / 1024 / 1024).round(2)
end

puts freespace("/")

require 'Win32API'

GetDiskFreeSpaceEx = Win32API.new('kernel32', 'GetDiskFreeSpaceEx',
																	'PPPP', 'I')
def freespace(dir=".")
  total_bytes = [0].pack('Q')
	total_free  = [0].pack('Q')
	GetDiskFreeSpaceEx.call(dir, 0, total_bytes, total_free)

	total_bytes = total_bytes.unpack('Q').first
	total_free  = total_free.unpack('Q').first
end

puts freespace("C:")

