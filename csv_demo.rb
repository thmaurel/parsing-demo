require 'csv'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'

# CSV PARSING

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

# CSV.foreach(filepath, csv_options) do |row|
#   p "#{row['Name']}. Appearance: #{row['Appearance']}. Origin: #{row['Origin']}."
# end

# CSV STORING

beers = [['Asahi', 'Pale Lager', 'Japan'], ['Guinness', 'Stout', 'Ireland'], ['Edelweiss', 'White', 'Austria'], ['Cuvée des Trolls', 'Blond', 'Belgium']]

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    csv << beer
  end
end
