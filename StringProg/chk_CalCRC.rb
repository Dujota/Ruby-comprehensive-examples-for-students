require 'zlib'

include Zlib

code = <<EOF
$crc1 = crc32("Hello")
$crc2 = crc32(" world!", $crc1)
$crc3 = crc32("Hello world!")
EOF

eval(code)
puts code
puts "----> $crc1: 0x#{$crc1.to_s(16)}  $crc2: 0x#{$crc2.to_s(16)}  $crc3: 0x#{$crc3.to_s(16)}"
