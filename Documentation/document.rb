# frozen_string_literal: false

##
# This is the document for testing

class BaseDocument
	def title
		raise "Not Implemented"
	end
	def title=
		raise "Not Implemented"
	end
	def author
		raise "Not Implemented"
	end
	def author=
		raise "Not Implemented"
	end
	def content
		raise "Not Implemented"
	end
end

class Document < BaseDocument
	# attr_accessor :writable
	attr_reader :title, :author, :content

	def initialize title, author, content
		raise "title isn't a String" unless title.kind_of? String
		raise "author isn't a String" unless author.kind_of? String
		raise "content isn't a String" unless content.kind_of? String
		
		@title, @author, @content = title, author, content
		yield(self) if block_given?
	end
	def words
		@content.split
	end
	def word_count
		words.size
	end
	alias_method :number_of_words, :word_count
	alias_method :size_in_words, :word_count
	
	def to_s
		"Doucment: #{title} by #{author}"
	end
	def about_me
		puts "I am #{self}"
		puts "My title is #{self.title}"
		puts "I have #{self.word_count} words"
	end
	def +(other)
		if other.kind_of?(String)
			return Document.new(title, author, "#{content} #{other}")
		end
		Document.new(title, author, "#{content} #{other.content}")
	end
	def !
		Document.new(title, author, "It is not true: #{content}")
	end

	def +@
		Document.new(title, author, "I am sure that #{content}")
	end
	def -@
		Document.new(title, author, "I doubt that #{content}")
	end

	def each_word
		# word_array = words
		# index = 0
		# while index < words.size
		# 	yield( word_array[index])
		# 	index += 1
		# end
		words.each {|word| yield(word)}
	end

	def each_word_pair
		word_array = words
		index = 0
		while index < (word_array.size - 1)
			yield word_array[index], word_array[index+1]
			index += 1
		end
	end
	attr_accessor :load_listener, :save_listener
	def load(path)
		@content = File.read(path)
		load_listener.on_load(self, path) if load_listener
	end
	def save(path)
		File.open(path, 'w') {|f| f.print(@content)}
		save_listener.on_save( self, path ) if save_listener
	end
	def self.const_missing(const_name)
		msg = %Q{
			You tired to reference the constant #{const_name}
			There is no such constant in the Document class.
		}
		raise msg
	end
	def method_missing(method_name, *args)
		File.open('document.error', 'a') do |f|
			f.puts("Bad method called: #{method_name}")
			f.puts( "with #{args.size} arguments")
		end
		super
		"missing method #{method_name}"
	end
end
class LazyDocument < BaseDocument
	attr_writer :title, :author, :content
	def initialize(path)
		@path = path
		@document_read = false
	end
	def read_document
		return if @document_read
		File.open( @path ) do |f|
			@title = f.readline.chomp
			@author = f.readline.chomp
			@content = f.read
		end
		@document_read = true
	end
	def title
		read_document
		@title
	end
	def title=( new_title )
		read_document
		@title = new_title
	end
end

class PrintableDocument < Document
	def print( printer)
		return 'Printer unavailable' unless printer.available?
		printer.render( "#{title}\n")
		printer.render( "By #{author}\n")
		printer.render( content)
		'Done'
	end
end

class DocumentSaveListener
	def on_save( doc, path)
		puts "Hey, I've been saved!"
	end
end
class DocumentLoadListener
	def on_load(doc, path)
		puts "Hey, I've been loaded!"
	end
end

class Title
	attr_reader :long_name, :short_name
	attr_reader :isbn
	def initialize(long_name, short_name, isbn)
		@long_name = long_name
		@short_name = short_name
		@isbn = isbn
	end
	def to_s
		"Title: #{@long_name}, #{short_name}, isbn:#{isbn}"
	end
end
class Author
	attr_reader :first_name, :last_name
	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name  = last_name
	end
end

# doc = Document.new('Ethics', 'Spinoza', 'By that which is...')
# puts doc.word_count

# doc.about_me

# puts "== to_s =="
# puts doc
# two_cities = Title.new( 'A Tale of Two Cities',
# 												'2 Cities', '0-999-9999-9')
# dickens = Author.new( 'Charles', 'Dickens')
# doc = Document.new(two_cities, dickens, 'It was the best...')

# puts doc.title
# puts doc.author 
# puts doc.description
# puts doc.content 
# puts "first + second  <--- first.+(second) by add def +(other)"
# doc1 = Document.new('Tag Line1','Kirk', "these are the voyages")
# doc2 = Document.new('Tag Line2', 'Kirk', "of the star ship ...")
# total_document = doc1 + doc2
# puts total_document.content

# puts "--def ! expriement--"
# favorite = Document.new('Favorite', 'Russ', 'Chocolate is best')
# xxx = !favorite
# puts xxx.content

# puts "+object and -object method check +@, -@"
# favorite = Document.new('Favorite', 'Russ', "Chocolate is best")
# unsure = -(+favorite)
# puts unsure.content

# puts "-- Object + 'strings' check if String or not -- "
# doc = Document.new('hi', 'russ', 'hello')
# new_doc = doc + 'out there!'
# puts new_doc.content

