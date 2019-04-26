require 'rinda/tuplespace'

ts = Rinda::TupleSpace.new
observer = ts.notify 'write', [nil]

Thread.start do 
  observer.each { |t| puts t}
end

3.times { |i| ts.write [i]}

sleep 1

