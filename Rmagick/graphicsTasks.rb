require 'rmagick'

def show_info(fname)
	img = Magick::Image::read(fname).first
	fmt = img.format
	w,h = img.columns, img.rows
	dep = img.depth
	nc = img.number_colors
	nb = img.filesize
	xr = img.x_resolution
	yr = img.y_resolution
	res = Magick::PixelsPerInchResolution ? "inch" : "cm"

	puts <<-EOF.gsub(/^\s+/,'')
	File:         #{fname}
	Format:       #{fmt}
	Dimensions:   #{w}x#{h} pixels
	Colors:       #{nc}
	Image size:   #{nb} bytes
	Resolution:   #{xr}/#{yr} pixels per #{res}
	EOF
	puts
end
srcfile = "sample.jpg"
puts "=== showing information of #{srcfile}, .gif or .xxx ==="
show_info(srcfile)
#show_info("vw.jpg")

puts <<-EOF
=== convert image to any kind of format ===
  The file extension is used to determine the new format. 

EOF
dstfile = "sample.gif"
form1 = File.extname(srcfile)
form2 = File.extname(dstfile)
puts "covert #{srcfile} to #{dstfile}  -- #{form1} to #{form2}"
img = Magick::Image.read(srcfile)
img.first.write(dstfile)

#img.destroy!

