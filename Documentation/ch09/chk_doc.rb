require '../document'

describe Document do 
	before do 
		@text = 'A bunch of words'
		# @doc = Document.new('test', 'nobody', @text)
		@doc = PrintableDocument.new('test', 'nobody', @text)
	end

	# it "should hold on to the contents" do 
	# 	@doc.content.should == @text
	# end

	# it 'should return all of the words in the document' do 
	# 	@doc.words.include?( 'A').should == true
	# 	@doc.words.include?('bunch').should == true
	# 	@doc.words.include?('of').should == true
	# 	@doc.words.include?('words').should == true
	# end
	# it 'should know how many words it contains' do 
	# 	@doc.word_count.should == 4
	# end
	it 'should know how to print itself' do 
		stub_printer = stub :available? => true, :render => nil
		@doc.print( stub_printer ).should == 'Done'
	end
	it 'should return the proper string if printer is offline' do 
		stub_printer = stub :availables? => false, :render => nil
		@doc.print( stub_printer ).should == 'Printer unavailable'
	end
end
