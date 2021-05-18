recipes = Recipe.create([
  {
    name: "American chop suey"
  },
  {
    name: "Tasty balls"
  }
])

ingredients = Ingredient.create([
  {
    name: "Green pepper"
  },
  {
    name: "Ground turkey"
  },
  {
    name: "Italian seasoning"
  },
  {
    name: "Elbow macaroni"
  },
  {
    name: "Chili sauce"
  }
])

amchopsuey_ingredients = [
  {
    ingredient: Ingredient.find_by(slug: 'green-pepper'),
    amount: 1,
    unit: "pepper"
  },
  {
    ingredient: Ingredient.find_by(slug: 'ground-turkey'),
    amount: 1,
    unit: "pound"
  },
  {
    ingredient: Ingredient.find_by(slug: 'italian-seasoning'),
    amount: 2,
    unit: "teaspoon"
  },
  {
    ingredient: Ingredient.find_by(slug: 'elbow-macaroni'),
    amount: 1,
    unit: "pound"
  }
]

tasyballs_ingredients = [
  {
    ingredient: Ingredient.find_by(slug: 'ground-turkey'),
    amount: 1,
    unit: "pound"
  },
  {
    ingredient: Ingredient.find_by(slug: 'italian-seasoning'),
    amount: 2,
    unit: "teaspoon"
  },
  {
    ingredient: Ingredient.find_by(slug: 'chili-sauce'),
    amount: 1,
    unit: "bottle"
  }
]

amchopsuey_recipe = Recipe.find(1)
tastyballs_recipe = Recipe.find(2)

amchopsuey_ingredients.each do |i|
  puts i[:name]
  RecipeIngredient.create(amount: i[:amount], unit: i[:unit], recipe: amchopsuey_recipe, ingredient: i[:ingredient])
end
tasyballs_ingredients.each do |i|
  RecipeIngredient.create(amount: i[:amount], unit: i[:unit], recipe: tastyballs_recipe, ingredient: i[:ingredient])
end
