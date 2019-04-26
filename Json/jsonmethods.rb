require 'json'

puts "JSON.load: Json形式のファイルを読み込んでハッシュに変換"
File.open("sample.json") do |file|
  hash = JSON.load(file)
	p hash
end

puts "JSON.parse: Json形式の文字からhashへ変換 ==="
$str = '{"Ocean": {"Squid":10, "Octopus":8}}'
puts $str
hoge= JSON.parse($str)
print "    -->" , hoge
puts 

puts "JSON.generate: hashからJSON形式の文字列へ変換 ==="
str = JSON.generate({ "Ocean" => {"Squid" => 10, "Octopus" => 8}})
print "    -->" , str
puts

puts "JSON.dump: hashからJSONファイルへ書込み ==="
File.open("sample2.json", 'w') do |file|
  hash = { "Ocean" => {"Squid" => 10, "Octopus" => 8}}
	puts "#{hash} into 'sample2.json'"
	str = JSON.dump(hash,file)
end

puts "JSON.pretty_generate: hashをJSON形式にきれいに整形する ==="
hash = { "Ocean" => {"Squid" => 10, "Octopus" => 8}}
json_str = JSON.pretty_generate(hash)
puts json_str

