require 'open-uri'
require 'nokogiri'
require 'json'

# Let's scrape recipes from http://www.epicurious.com

puts "Which ingredient are you using?"

ingredient = gets.chomp

url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_string = open(url).read

html_doc = Nokogiri::HTML(html_string)
recipes = {
  title: "recipes",
  recipes: []
}
html_doc.search('.standard-card-new').each do |card|
  title = card.search('.standard-card-new__article-title').text
  url = card.search('.standard-card-new__article-title').attribute('href').value
  full_url = "https://www.bbcgoodfood.com" + url
  html_string = open(full_url).read
  html_doc = Nokogiri::HTML(html_string)
  desc = html_doc.search('.editor-content').text[0..100]
  recipes[:recipes] << {title: title, description: desc}
  # puts "#{title} : #{desc}"
  # print "\n"
end

p recipes

p "which title?"
title = gets.chomp

p "which desc?"
desc = gets.chomp

recipes[:recipes] << {title: title, description: desc}


filepath    = 'data/beers.json'


File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(recipes))
end
