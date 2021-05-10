class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end

  validates :name, presence: true
end
