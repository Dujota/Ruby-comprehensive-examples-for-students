require 'tk'

root = TkRoot.new() { title "Today's Date"}
str = Time.now.strftime("Today is \n%B %d %Y")
lab = TkLabel.new(root) do
  text str
	pack("padx" => 15, "pady" => 10, "side" =>  "top")
end
Tk.mainloop

puts <<-EOF
  After creating the root itself, we create a string containing
  the date. Then while creating the label, we set the text to be
	the value of str and call pack to arrange everything neatly.
	We tell "pack" to use a padding of 15 pixels horizontally and 10 pixels
	vertically, and we ask that the text be centered on the label.
EOF

