require 'net/http'
require 'thread'

class TrueRandom
  URL = "https://www.random.org/integers/"

	def initialize(min = 0, max = 1, buffsize = 1000, slack = 300)
	  @buffer = SizedQueue.new(buffsize)
		@min, @max, @slack = min, max, slack
		@thread = Thread.new { fillbuffer }
	end

	def fillbuffer
	  count = @buffer.max - @buffer.size
		uri = URI.parse(URL)
		uri.query = URI.encode_www_form(
		  col: 1, base: 10, format: "plain", rnd: "new",
			num: count, min: @min, max: @max
		)
		Net::HTTP.get(uri).lines.each do |line| 
		  @buffer.push line.to_i
		end
	end

	def rand
	  if @buffer.size < @slack && !@thread.alive?
			@thread = Thread.new { fillbuffer}
		end
	  @buffer.pop
	end
end

t = TrueRandom.new(1, 6, 1000, 300)
count = Hash.new(0)

10000.times do |n|
  count[t.rand] += 1
end
p count

