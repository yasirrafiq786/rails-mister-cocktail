require 'open-uri'

puts "Destroying Cocktails"
Cocktail.destroy_all
puts "Destroying Ingredients"
Ingredient.destroy_all


puts 'Creating Ingredients'
ingredients = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)

ingredients["drinks"].each do |ele|
    Ingredient.create(name:ele["strIngredient1"])
end

puts "Done making Ingredients"

puts "Creating Few Cocktails"

20.times do
    Cocktail.create(name:Faker::Beer.name)
end