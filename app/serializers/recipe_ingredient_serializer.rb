class RecipeIngredientSerializer
  include JSONAPI::Serializer

  attributes :amount, :unit
  belongs_to :recipe
  belongs_to :ingredient
end
