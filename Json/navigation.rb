require 'json'
require 'open-uri'
require 'pp'

json = open("https://api.github.com/repos/ruby/ruby/contributors")
users = JSON.parse(json.read)

pp users.first

users.sort_by! {|u| u["contributors"]}
puts users[0...10].map {|u| u["login"]}.join(", ")


