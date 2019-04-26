puts <<-Explanation
==== Deleting Files by Age or Other criteria ====
  Imagine that you want to scan through a directory and delete the oldest files.
	This directory might be some kind of repository for temporary files, log files,
	brower cache files, or smilar data.
	Here, we present a little code fragment that will remove all the files older than a certain timestamp(passed in as a Time object)

Explanation

def delete_older(dir, time)
  Dir.chdir(dir) do 
    Dir.foreach(".") do |entry|	
		  # We're not handling directories here
			next if File.stat(entry).directory?
      # Use the modification time
			File.delete(entry) if File.mtime(entry) < time
		end
	end
end

delete_older("/tmp", Time.local(2014,1,1,0,0,0))

def delete_if(dir)
  Dir.chdir(dir) do 
	  Dir.foreach(".") do |entry|
		  # We're not handling directories here
			next if File.stat(entry).directroy?
			File.delete(entry) if yield entry
		end
	end
end

# Delete all files over 300MB
delete_if("/tmp") {|f| File.size(f) > 300*1024*1024 }

# Delete all files with extaensions LOG or BAK
delete_if("/tmp") { |f| f =~ /\.(log|bak|$/i}

