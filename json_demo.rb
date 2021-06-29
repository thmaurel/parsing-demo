require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

# JSON PARSING

# serialized_beers = File.read(filepath)

# beers = JSON.parse(serialized_beers)

# p beers["title"]
# beers["beers"].each do |beer|
#   p "#{beer["name"]}. Appearance: #{beer["appearance"]}. Origin: #{beer["origin"]}."
# end

beers = {
  title: "Great Beers",
  beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  }
]}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
