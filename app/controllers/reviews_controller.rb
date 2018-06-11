class ReviewsController < ApplicationController
  
  def index

  end

  def show

  end

  def destroy

  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create rating: params["rating"],
                  review_text: (params["review"]),
                  user_id: session["user_id"],
                  recipe_id: params["id"]
  
    if @review.save
      redirect_to "/recipes", notice: "Thanks for adding a review!"
    else 
      redirect_to "/reviews/#{@review.recipe_id}/new","Your review was not added. Please rate between 0 and 5."
    end
  end

  def edit

  end

  def update
    review = Review.find_by(id: params["id"])

    review.update rating: params["rating"],
                review_text: (params["review"])

    redirect_to "/recipes/#{review.recipe_id}", notice: "Review updated."
  end

end
