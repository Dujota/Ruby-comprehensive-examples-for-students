module DRbObserverable

  def observer_peers
	  @observer_peers ||=[]
	end
	def add_observer(observer)
	  unless observer.respond_to? :update
		  raise NameEroor, "observer needs to respond to 'update'"
		end
		observer_peers.push observer
	end
	def delete_observer(observer)
	  observer_peers.delete(observer)
  end

	def notify_observers(*arg)
	  observer_peers.dup.each do |peer|
		  peer.update(*arg) rescue delete_observer(i)
		end if observer_peers.any?
	end
end


