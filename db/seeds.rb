# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# filepath = 'beers.json'

serialized_ingredients = open(url).read

ingredients = JSON.parse(serialized_ingredients)

ingredients_arr = []

ingredients["drinks"].each do |drink|
  ingredients_arr << drink["strIngredient1"]
end

ingredients_arr.each do |ingredient|
  Ingredient.create(name: ingredient)
end
