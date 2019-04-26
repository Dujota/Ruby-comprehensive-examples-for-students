def commas(x)
  str = x.to_s.reverse
  str.gsub!(/([0-9]{3})/, "\\1,")
  str.gsub(/,$/,"").reverse
end

puts commas(1234567)

