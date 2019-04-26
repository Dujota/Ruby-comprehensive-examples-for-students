# ts01c2.rb
require 'drb/drb'

def fact_client(ts, a, b, n=1000)
  req = []
  a.step(b, n) { |head|
    tail = [b, head + n - 1].min
    req.push([head, tail])
    ts.write(['fact', head, tail])
  }
  req.inject(1) { |value, range|
    tuple = ts.take(['fact-answer', range[0], range[1], nil])
    value * tuple[3]
  }
end

ts_uri = ARGV.shift || 'druby://localhost:12345'
DRb.start_service
$ts = DRbObject.new_with_uri(ts_uri)
# p fact_client($ts, 1, 20000)
fact_client($ts, 1, 20000) # (注)
