# peom_words=['twinkle', 'little', 'star', 'how', 'I', 'wonder']
# #poem_words = %w{   }

# freq = { "I" => 1, "don't" => 1, "like" => 1, "spam" =>963}

# for i in 0..(peom_words.size - 1)
# 	puts peom_words[i]
# end
# peom_words.each {|word| puts word}

movie = { title: '2001', genre: 'sci fi', rating: 10}

movie.each {|entry| p entry}
puts "==hash keys and data=="
movie.each {|name, value| puts "#{name} => #{value}"}

@words = %w{Mary had a little lamb}
puts "#{@words}"
puts <<-EOF
def index_for(word)
	@words.find_index {|this_word| word == this_word }
end
EOF
def index_for(word)
	@words.find_index {|this_word| word == this_word }
end

puts "index_for(\"had\") => #{index_for("had")}"


