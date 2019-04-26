require 'rinda/tuplespace'

ts = Rinda::TupleSpace.new

alberts = ts.notify "write", ["Albert", nil]
martins = ts.notify "take",  ["Martin", nil]

Thread.new do 
  alberts.each { |op, t| puts "#{op}: #{t.join(' ')}"}
end

Thread.new do 
  martins.each { |op,t| puts "#{op}: #{t.join(' ')}" }
end

sleep 1

ts.write ["Martin", "Luther"]
ts.write ["Albert", "Einstein"]
ts.write ["Martin", "Fowler"]
ts.write ["Albert", "Schweitzer"]
ts.write ["Martin", "Scorsese"]
ts.take  ["Martin", "Luther"]
sleep 1
