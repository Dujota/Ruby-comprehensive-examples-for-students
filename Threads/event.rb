puts <<-Explanation
=== Waiting for an Event (I wonder if it is event?)===
 In the following example, we see three threads doing the "work" of an application. Another thread simply wakes up every second, checks the global variable $flag and wakes up two other threads when it sees the flag set.
 This saves the three worker threads from interacting directly with the two
 other threads and possibly making multiple attempts to awaken them 
Explanation
puts <<-CODE
$flag = false
work1 = Thread.new { job1()}
work2 = Thread.new { job2()}
work3 = Thread.new { job3()}

thread4 = Thread.new { Thread.stop; job4()}
thread5 = Thread.new { Thread.stop; job5()}

watcher = Thread.new do
  loop do 
    sleep 1
    if $flag
      thread4.wakeup
      thread5.wakeup
      Thread.exit
    end
  end
end
CODE

def process_file(filename)
  puts "processing file #{filename}"
end
def waitfor(filename)
  loop do 
    if File.exist? filename
      puts "found #{filename}"
      file_processor = Thread.new {process_file(filename)}
      Thread.exit
    else
      sleep 1
    end
  end
end

waiter1 = Thread.new {waitfor("Godot")}
waiter2 = Thread.new {waitfor("Guffman")}
headwaiter = Thread.new {waitfor("head")}

sleep 10
