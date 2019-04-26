require 'gtk3'
Gtk.init

window = Gtk::Window.new("Today's Date")
window.signal_connect("destroy") { Gtk.main_quit }
str = Time.now.strftime("Today is \n%B %d, %Y")
window.add(Gtk::Label.new(str))

window.set_default_size(200,100)
window.show_all
Gtk.main

