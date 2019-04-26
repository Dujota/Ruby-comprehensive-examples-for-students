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

