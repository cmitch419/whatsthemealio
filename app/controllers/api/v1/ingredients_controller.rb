module Api
  module V1
    class IngredientsController < ApplicationController
      protect_from_forgery with: :null_session
      def create
        ingredient = Ingredient.new(ingredient_params)

        if ingredient.save
          render json: IngredientSerializer.new(ingredient).serializable_hash.to_json
        else
          render json: { ingredient.errors.messages }, status: 422
        end
      end
      
      def destroy
        ingredient = Ingredient.find_by(slug: params[:slug])

        if ingredient.destroy
          head :no_content
        else
          render json: { ingredient.errors.messages }, status: 422
        end
      end

      private

      def ingredient_params
        params.require(:ingredient).permits(:name, :description)
      end
    end
  end
end