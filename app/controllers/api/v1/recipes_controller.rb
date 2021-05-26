module Api
  module V1
    class RecipesController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        recipes = Recipe.all

        render json: RecipeSerializer.new(recipes, options).serializable_hash.to_json
      end

      def show
        recipe = Recipe.find(params[:id])

        render json: RecipeSerializer.new(recipe, options).serializable_hash.to_json
      end

      def create
        recipe = Recipe.new(recipe_params)

        if recipe.save
          render json: RecipeSerializer.new(recipe).serializable_hash.to_json
        else
          render json: { error: recipe.errors.messages }, status: 422
        end
      end

      def update
        recipe = Recipe.find(params[:id])

        if recipe.update(recipe_params)
          render json: RecipeSerializer.new(recipe, options).serializable_hash.to_json
        else
          render json: { error: recipe.errors.messages }, status: 422
        end
      end

      def destroy
        recipe = Recipe.find(params[:id])

        if recipe.destroy
          render json: { status: 200, message: "Success" }
        else
          render json: { error: recipe.errors.messages }, status: 422
        end
      end

      private
      
      def recipe_params
        params.require(:recipe).permit(:name, :description)
      end

      def options
        @options ||= {
          include: %i[ingredients recipe_ingredients]
        }
      end

    end
  end
end
