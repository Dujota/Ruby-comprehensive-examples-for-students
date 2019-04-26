#!/usr/bin/ruby -w
require './tabcontrol'

foo = "This   is        only   a   test."

puts foo
puts foo.entab(4)
puts foo.entab(4).dump
