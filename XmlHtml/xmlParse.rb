puts <<-Exp
=== Parsing XML ===
  Parsing HTML using the Nokogiti library can be done usign the Nokogiri::HTML
	class method parse. 

Exp

require 'nokogiri'
doc = Nokogiri::XML.parse File.read("books.xml")

p doc.root.name
p doc.root["shelf"]

books = doc.css("section book")
books = doc.xpath("//section/book")

books.each do |book|
  title = book.elements.first.text
	authors = book.css("author").map(&:text)
	puts "#{title} (ISBN #{book["isbn"]})"
	puts "   by #{authors.join(' and ')}"
end

p doc.root.elements.map {|e| e["name"] }

space = doc.at_css("section[name=Space]")
space = doc.at_xpath("//section[@name='Spcae']")
puts books.include?(space.elements.first)

