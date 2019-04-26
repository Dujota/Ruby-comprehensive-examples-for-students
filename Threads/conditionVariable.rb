require 'thread'
puts <<-COMMENT
====== Condition Variables =====
  A condition variable is really just a queue of threads. It is used in 
  conjunction with a mutex to provide a higher level of control when
  synchronizing threads.
  A condition variable allows you to relinquish control of the mutex until
  certain conidtion has been met. It can sleep on the condition variable and wait to be awakened when the condition is met.

COMMENT
@music = Mutex.new
@violin = ConditionVariable.new
@bow   = ConditionVariable.new

@violins_free = 2
@bows_free    = 1
@player = ("A".."G").to_a
def musician(n)
	space = " " * n * 20
  3.times do 
	  sleep rand
		@music.synchronize do 
			# waiting @music metex if @vilolins_fre > 0
		  @violin.wait(@music) while @violins_free == 0
			@violins_free -= 1
			puts "#{space} #{@player[n]} got a violin (left v-#@violins_free,b-#@bows_free)" 
			@bow.wait(@music) while @bows_free == 0
			@bows_free -= 1
			puts "#{space} #{@player[n]} got a bow    (left v-#@violins_free,b-#@bows_free)"
		end
	  sleep rand
		puts "#{space} #{@player[n]}:  (...playing...)"
		sleep rand
		puts "#{space} #{@player[n]}: Now I've finished."

		@music.synchronize do 
		  @violins_free += 1
			# send a signal to @music metex if @vilolins_fre == 1
		  @violin.signal if @violins_free == 1
		  @bows_free += 1
		  @bow.signal if @bows_free == 1
		end
	end
end

threads =[]
3.times {|i| threads << Thread.new { musician(i)}}

threads.each {|t| t.join}

