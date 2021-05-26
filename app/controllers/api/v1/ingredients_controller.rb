module Api
  module V1
    class IngredientsController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        ingredients = Ingredient.all

        render json: IngredientSerializer.new(ingredients, options).serializable_hash.to_json
      end

      def show
        ingredient = Ingredient.find_by id:params[:id]

        render json: IngredientSerializer.new(ingredient, options).serializable_hash.to_json
      end

      def create
        ingredient = Ingredient.new(ingredient_params)

        if ingredient.save
          render json: IngredientSerializer.new(ingredient).serializable_hash.to_json
        else
          render json: { error: ingredient.errors.messages }, status: 422
        end
      end

      def update
        ingredient = Ingredient.find_by id:params[:id]

        if ingredient.update(ingredient_params)
          render json: IngredientSerializer.new(ingredient, options).serializable_hash.to_json
        else
          render json: { error: ingredient.errors.messages }, status: 422
        end
      end

      def destroy
        ingredient = Ingredient.find_by id:params[:id]

        if ingredient.destroy
          render json: { status: 200, message: "Success" }
        else
          render json: { error: ingredient.errors.messages }, status: 422
        end
      end

      private
      
      def ingredient_params
        params.require(:ingredient).permit(:name, :description)
      end

      def options
        @options ||= { include: %i[recipes recipe_ingredients] }
      end

    end
  end
end