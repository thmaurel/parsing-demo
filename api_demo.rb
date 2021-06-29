require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
puts 'Give a github username'

username = gets.chomp

url = "https://api.github.com/users/#{username}"

user_serialized = open(url).read

user = JSON.parse(user_serialized)

puts "#{user["name"]} : #{user["bio"]}"
