require 'tk'

root = TkRoot.new() { title "Today's Date"}
str = Time.now.strftime("Today is \n%B %d %Y")
lab = TkLabel.new(root) do
  text str
	pack("padx" => 15, "pady" => 10, "side" =>  "top")
end
Tk.mainloop

