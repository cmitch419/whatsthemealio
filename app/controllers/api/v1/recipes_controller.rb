module Api
  module V1
    class RecipesController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        recipes = Recipe.all

        render json: RecipeSerializer.new(recipes, options).serializable_hash.to_json
      end

      def show
        recipe = Recipe.find_by(slug: params[:slug])

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
        recipe = Recipe.find_by(slug: params[:slug])

        if recipe.update(recipe_params)
          render json: RecipeSerializer.new(recipe, options).serializable_hash.to_json
        else
          render json: { error: recipe.errors.messages }, status: 422
        end
      end

      def destroy
        recipe = Recipe.find_by(slug: params[:slug])

        if recipe.destroy
          head :no_content
        else
          render json: { error: recipe.errors.messages }, status: 422
        end
      end

      private
      
      def recipe_params
        params.require(:recipe).permit(:name, :description)
      end

      def options
        @options ||= { include: %i[recipe_ingredients] }
      end

    end
  end
end