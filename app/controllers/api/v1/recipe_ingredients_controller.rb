module Api
  module V1
    class RecipeIngredientsController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        recipe_ingredients = RecipeIngredient.all

        render json: RecipeIngredientSerializer.new(recipe_ingredients).serializable_hash.to_json
      end

      def show
        recipe_ingredient = RecipeIngredient.find(params[:id])

        render json: RecipeIngredientSerializer.new(recipe_ingredient, options).serializable_hash.to_json
      end

      def create
        recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)

        if recipe_ingredient.save
          render json: RecipeIngredientSerializer.new(recipe_ingredient).serializable_hash.to_json
        else
          render json: { error: recipe_ingredient.errors.messages }, status: 422
        end
      end

      def update
        recipe_ingredient = RecipeIngredient.find(params[:id])

        if recipe_ingredient.update(recipe_ingredient_params)
          render json: RecipeIngredientSerializer.new(recipe_ingredient, options).serializable_hash.to_json
        else
          render json: { error: recipe_ingredient.errors.messages }, status: 422
        end
      end

      def destroy
        recipe_ingredient = RecipeIngredient.find(params[:id])

        if recipe_ingredient.destroy
          head :no_content
        else
          render json: { error: recipe_ingredient.errors.messages }, status: 422
        end
      end

      private
      
      def recipe_ingredient_params
        params.require(:recipe_ingredient, :recipe_id, :ingredient_id).permit(:unit, :amount)
      end

      def options
        @options ||= nil
      end

    end
  end
end