class IngredientSerializer
  include JSONAPI::Serializer

  attributes :name, :description
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
