require 'drb'
URI = "192.168.2.190"

class Warner
  include DRbUndumped    # this exists in drb.rb

	def initialize(ticker, limit)
	  @limit = limit
		puts self
		ticker.add_observer(self)   # all warners are observers
	end
end
class WarnLow < Warner
  def update(time, price) 	# callback for observer
	  if price < @limit
			print "--- #{time.to_s}: Price below #@limit: #{price}\n"
		end
	end
end

class WarnHigh < Warner
  def update(time, price)
	  if price > @limit
			print "+++ #{time.to_s}: Price above #@limit: #{price}\n"
		end
	end
end

DRb.start_service
ticker = DRbObject.new(nil, "druby://#{URI}:9001")

WarnLow.new(ticker, 90)
WarnHigh.new(ticker, 110)

puts "Press [return] to exit."
gets


