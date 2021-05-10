class RecipeIngredientSerializer
  include JSONAPI::Serializer
  attributes :amount, :unit, :recipe, :ingredient
end
