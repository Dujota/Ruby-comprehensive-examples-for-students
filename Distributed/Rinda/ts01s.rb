require 'drb/drb'

class FactServer
  def initialize(ts)
    @ts = ts
  end

  def main_loop
    loop do
      tuple = @ts.take(['fact', Integer, Integer])
      m = tuple[1]
      n = tuple[2]
      value = (m..n).inject(1) { |a, b| a * b }
      @ts.write(['fact-answer', m, n, value])
    end
  end
end

ts_uri = ARGV.shift || 'druby://localhost:12345'
DRb.start_service
$ts = DRbObject.new_with_uri(ts_uri)
FactServer.new($ts).main_loop

