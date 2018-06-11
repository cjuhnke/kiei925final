class RecipesController < ApplicationController

  def index
    for recipe in Recipe.all
      average_rating = Review.where(recipe_id: recipe.id).average(:rating)
      if average_rating != nil
        Recipe.find_by(id: recipe.id).update avg_rating: average_rating
      end
    end
    @recipes = Recipe.order("avg_rating DESC").limit(10)
  end

  def show

  end

  def destroy
    Recipe.delete(params["id"])
    redirect_to "/recipes"
  end

  def new
    if session["user_id"] == nil
      redirect_to "/", notice: "You must be logged in to add a recipe."
    end
  end

  def create
    if session["user_id"] == nil
      redirect_to "/", notice: "You must be logged in to add a recipe."
    else
      Recipe.create name: params["name"],
                  total_time: (params["time"]),
                  image_url: params["image_url"],
                  ingredients: params["ingredients"],
                  instructions: params["instructions"],
                  user_id: session["user_id"]
  
      redirect_to "/recipes", notice: "Thanks for adding a recipe!"
    end
  end

  def edit

  end

  def update
    recipe = Recipe.find_by(id: params["id"])

    recipe.update name: params["name"],
                total_time: (params["time"]),
                ingredients: params["ingredients"],
                instructions: params["instructions"]

    redirect_to "/recipes/#{recipe.id}", notice: "Recipe updated."
  end

end
