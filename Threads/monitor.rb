require 'monitor'
puts <<-EOF
==== Monitor : the other synchronization mechanism ====
  
EOF
class OurQueue
  def initialize
	  @que = []
		@monitor = Monitor.new
		@empty_cond = @monitor.new_cond
	end

	def enq(obj)
	  @monitor.synchronize do 
		  @que.push(obj)
			@empty_cond.signal
		end
	end

	def deq
	  @monitor.synchronize do 
		  while @que.empty?
				@empty_cond.wait
			end
		  return @que.shift
		end
	end

	def size
	  @que.size
	end
end

class OurSizedQueue < OurQueue
  attr :max
	
	def initialize(max)
	  super()
		@max = max
		@full_cond = @monitor.new_cond
	end
	def enq(obj)
	  @monitor.synchronize do 
		  while @que.length >= @max
				@full_cond.wait
			end
		  super(obj)
		end
	end
	def deq
	  @monitor.synchronize do 
		  obj = super
			if @que.length < @max
				@full_cond.signal
			end
			return obj
		end
	end

	def max=(max)
	  @monitor.synchronize do 
		  @max = max
			@full_cond.broadcast
		end
	end
end

