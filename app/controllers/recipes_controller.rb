class RecipesController < ApplicationController
  def index
     user = User.find_by(id: session[:user_id])
     if user
      recipes = Recipe.all
      render json: recipes, include: [:user]
     else
       render json: {errors: ["Unauthorized"]}, status: :unauthorized
     end
  end

  def create
    user = User.find_by(id: session[:user_id])
    if user
     recipe = Recipe.create(recipe_params)
      if recipe.valid?
      render json: recipe, include: [:user], status: :created
      else
      render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
      end
    else
    render json: {errors: ["Unauthorized"]}, status: :unauthorized
    end
  end


  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end

end
