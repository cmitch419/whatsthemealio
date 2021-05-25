recipes = Recipe.create([
  {
    name: "American chop suey"
  },
  {
    name: "Tasty meatballs"
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
    ingredient: Ingredient.find(1),
    amount: 1,
    unit: "pepper"
  },
  {
    ingredient: Ingredient.find(2),
    amount: 1,
    unit: "pound"
  },
  {
    ingredient: Ingredient.find(3),
    amount: 2,
    unit: "teaspoon"
  },
  {
    ingredient: Ingredient.find(4),
    amount: 1,
    unit: "pound"
  }
]

meatballs_ingredients = [
  {
    ingredient: Ingredient.find(2),
    amount: 1,
    unit: "pound"
  },
  {
    ingredient: Ingredient.find(3),
    amount: 2,
    unit: "teaspoon"
  },
  {
    ingredient: Ingredient.find(5),
    amount: 1,
    unit: "bottle"
  }
]

amchopsuey_recipe = Recipe.find(1)
meatballs_recipe = Recipe.find(2)

amchopsuey_ingredients.each do |i|
  RecipeIngredient.create(amount: i[:amount], unit: i[:unit], recipe: amchopsuey_recipe, ingredient: i[:ingredient])
end
meatballs_ingredients.each do |i|
  RecipeIngredient.create(amount: i[:amount], unit: i[:unit], recipe: meatballs_recipe, ingredient: i[:ingredient])
end
