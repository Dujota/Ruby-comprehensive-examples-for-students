puts <<-Explanation
==== Stream Parsing ====
  The stream-style approach is a "parse as you go" technique, useful when
	your document are large or you have memory limitations; it parses the file
	as ea it reads it from disk, and the entire file is never stored in memory.
	Instead, as each element is read, user-supplied methods or blocks are run
	as callback.
	When the parser encounters an opening tag, it calls the "start_element"
	method, we use the name of the tag to decide what to do: 
  The "end_element" method prints a newline when each book information
	tag ends, after we have printed out the text was contained inside that tag.

Explanation

require 'nokogiri'

class Listener < Nokogiri::XML::SAX::Document
  def start_element(name, attrs = [])
	  case name
	  when "book"
		  isbn = attrs.find{|k,v| k == "isbn" }.last
			puts "New book with ISBN number #{isbn}"
		when "title", "author", "description"
		  print "#{name.capitalize}: "
		else
		end
	end
	def characters(string)
	  return unless string =~ /\w/    # ignore all-whitespace
		print string.tr("\n", " ").squeeze(" ")
	end
	
	def end_element(name)
	  print "\n" if %w[book title author description].include?(name)
	end
	
	def end_document
	  puts "The document has ended"
	end
end

xml = File.read("books.xml")
Nokogiri::XML::SAX::Parser.new(Listener.new).parse(xml)

	
