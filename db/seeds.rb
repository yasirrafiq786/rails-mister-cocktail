require 'open-uri'


puts 'Creating Ingredients'
ingredients = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)

ingredients["drinks"].each do |ele|
    Ingredient.create(name:ele["strIngredient1"])
end

puts "Done making Ingredients"