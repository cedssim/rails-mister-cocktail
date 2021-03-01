require 'open-uri'

puts "Cleaning up database..."
Cocktail.destroy_all
puts "Database is clean!"

data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
drink = JSON.parse(data)
drink_ingredients = drink["drinks"]

drink_ingredients.each do |drink_ingredient|
  individual_ingredient = drink_ingredient["strIngredient1"]
  Ingredient.create(name: "#{individual_ingredient}")
end

puts "Done!"
