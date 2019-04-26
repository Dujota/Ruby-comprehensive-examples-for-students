require 'stringio'

text = "abcdefghijkl\nABC\n123"
puts text
ios = StringIO.new(text)

ios.seek(5)
ios.puts("xyz")
puts ".seek(5) and .puts(\"xyz\") offset --> #{ios.tell}:\"#{ios.getc}\""
puts ios.string.inspect

ios.ungetc(?w)
puts ios.string.inspect


