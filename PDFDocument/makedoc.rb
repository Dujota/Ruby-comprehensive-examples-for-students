require "Prawn"

#f_name = File.basename(__FILE__, ".rb")+".pdf"

#Prawn::Document.generate(f_name) {
#stroke_axis
#
#}
puts <<-END
==== Sample1 my_first.pdf ====
  doc = Prawn::Document.new
  doc.text "Lorem ipsum dolor..."		# Add some text
  doc.render_file "my_first.pdf"		# Write to a file
END
doc = Prawn::Document.new
doc.text "Lorem ipsum dolor..."		# Add some text
doc.render_file "my_first.pdf"		# Write to a file

puts <<-END
==== Sample2 portrait.pdf ====
  Prawn::Document.generate("portrait.pdf") do 
    text "Once upon a time and a very good time it was "
	  text "there was a moocow coming down along the road..."
  end
END
Prawn::Document.generate("portrait.pdf") do 
  text "Once upon a time and a very good time it was "
	text "there was a moocow coming down along the road..."
end

puts <<-END
==== Sample3 ericblair.pdf ====
  Prawn::Document.generate("ericblair.pdf") do |doc|
    doc.text "It was a bright cold day in April, "
	  doc.text "and the clocks were striking thirteen."
  end
END
Prawn::Document.generate("ericblair.pdf") do |doc|
  doc.text "It was a bright cold day in April, "
	doc.text "and the clocks were striking thirteen."
end
