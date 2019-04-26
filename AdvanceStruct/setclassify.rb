require 'set'

files = Set.new(Dir["*"])
hash = files.classify do |f|
  if File.size(f) <= 10_000
    :small
  elsif File.size(f) <= 10_000_000
    :medium
  else
    :large
  end
end
puts hash.class

big_files = hash[:large]
medium_files = hash[:medium]
small_files = hash[:small]

puts big_files.inspect
puts medium_files.inspect
puts small_files.inspect
