#! /usr/bin/ruby -w
##  

code = <<-EOF
  class String
    def rot13
      self.tr("A-Ma-mN-Zn-z", "N-Zn-zA-Ma-m")
    end
  end
  EOF
src = <<-EOF
  joke = "Y2K bug"
  $joke13 = joke.rot13
  EOF
puts code
eval(code)
puts src
eval(src)
puts "$joke13:#{$joke13}"
src = <<EOF
  episode2 = "Fcbvyre: Naanxva qbrfa'g trg xvyyrq."
  puts episode2.rot13
EOF
puts src
eval(src)

