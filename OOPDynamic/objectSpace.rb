
ObjectSpace.each_object(Bignum) do |obj|
  printf "%20s: %s\n", obj.class, obj.inspect
end

require 'pp'
p ObjectSpace.count_objects

