require 'prawn'

class DemoDocument
  def initialize
	  @pdf = Prawn::Document.new
	end
	def render_file(file)
	  render
		@pdf.render_file(file)
	end
	def render
	  side = @pdf.bounds.width / 2.0
		box(   0,    0, side, side) { star }
		box(side,    0, side, side) { heart } 
		box(   0, side, side, side) { ruby }
		box(side, side, side, side) { misc_text }
	end
	private

  # Run the given block in a bounding box inset from the parent by
  # 'padding' PDF points.
	def inset(padding)
	  left = @pdf.bounds.left + padding
    top  = @pdf.bounds.top  - padding
		@pdf.bounding_box([left, top],
		   width: @pdf.bounds.width - 2 * padding,
			 height: @pdf.bounds.height - 2 * padding) { yield }
	end
  
  # Draw a width-by-height box at (x, y), yielding insdie a bounding
  # box so content may be drawn inside.
	def box(x, y, w, h)
	  @pdf.bounding_box([x, @pdf.bounds.top - y], width: w, height: h) do 
		  @pdf.stroke_bounds
			inset(10) { yield }
		end
	end

	def star
	  reps = 15
		size = 0.24 * @pdf.bounds.width
		radius = 0.26 * @pdf.bounds.width
		center_x = @pdf.bounds.width / 2.0
		center_y = @pdf.bounds.height / 2.0
		reps.times do |i|
		  @pdf.rotate i * 360.0 / reps, origin: [center_x, center_y] do 
			  edge = center_y + radius
				@pdf.draw_text ")", size: size, at: [center_x, edge]
			end
		end
	end

	def ruby 
   @pdf.image "ruby.png", 
	            at: [0, @pdf.cursor],
							width: @pdf.bounds.width,
							height: @pdf.bounds.height
	end

	def heart
	  10.times do |i|
		  inset(i * 10) do 
			  box = @pdf.bounds
				center = box.width / 2.0
				cusp_y = 0.6 * box.top

				k = center * Prawn::Graphics::KAPPA
				@pdf.stroke_color(0, 0, 0, 100 - (i * 10))
				@pdf.stroke do 
				  # Draw a heart using a Bezier curve with two paths
					paths = [[0, 0.9 * center], [box.right, 1.1 * center]]
					paths.each do |side, midsize|
					  @pdf.move_to [center, cusp_y]
						@pdf.curve_to [side, cusp_y],
						    bounds: [[center, cusp_y + k], [side, cusp_y + k]]
					  @pdf.curve_to [center, box.bottom], 
						    bounds: [[side, 0.6 * cusp_y], [midsize, box.bottom]]
					end
				end
			end
		end

		# reset stroke color
		@pdf.stroke_color 0, 0, 0, 100
	end

	def misc_text
	  first_lines = <<-EOF
		  Call me Ishmael. Somewhere in la Mancha, in a place whose
			name I do not care to remember, a gentleman lived not long
			ago, one of those who has a lance and ancient shield on a
			shelf and keeps a skinny nag and a greyhoind for racing.
			The sky above the port was the color of television, tuned to
			a dead channel. It was a pleasure to burn. Granted: I am an
			inmate of a mental hospital; my keeper is watching me, he 
			never see through a blue-eyed type like me. Whether I shall
			turn out to be the hero of my own life, or whether that 
			station will be held by anybody else, these pages must show.
			I have never begun a novel with more misgiving.
    EOF
    first_lines.gsub!(/\n/, " ")
		first_lines.gsub!(/ +/, " ")
		@pdf.text first_lines
	end
end

DemoDocument.new.render_file("demo.pdf")


