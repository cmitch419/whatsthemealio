recipes = Recipe.create([
  {
    name: "American chop suey",
    description: "Mommy's comfort food."
  },
  {
    name: "Tasty meatballs",
    description: "Easy and delicious."
  }
])

ingredients = Ingredient.create([
  {
    name: "Green pepper",
    description: "It's a pepper. It's green. It's not spicy."
  },
  {
    name: "Ground turkey",
    description: "Gobble gobble gobble"
  },
  {
    name: "Italian seasoning",
    description: "Smells like Little Italy in a can."
  },
  {
    name: "Elbow macaroni",
    description: "Dry pasta. Can be substituted with kneecap macaroni in a pinch."
  },
  {
    name: "Chili sauce",
    description: "It's like ketchup with an attitude."
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
