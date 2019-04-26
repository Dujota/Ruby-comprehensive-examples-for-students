class Float
  DIFF = 1e-6
  def ==(x)
     (self - x).abs < DIFF
  end
end

x = 1.0000010/0.003
y = 0.003 * x

if y == 1.0
  print "yes y:#{y} == 1.0 < "
else
  print "no  y:#{y} == 1.0 > "
end
printf("%f\n", Float::DIFF)
printf("%f\n", (y - 1.0).abs)
