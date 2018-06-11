class UsersController < ApplicationController

  def index

  end

  def show

  end

  def destroy

  end

  def new

  end

  def create
    User.create username: params["username"],
                name: params["name"],
                email: params["email"],
                password: params["password"]
    
    redirect_to "/", notice: "Thanks for signing up!"
  end

  def edit

  end

  def update
    user = User.find_by(id: params["id"])

    user.update name: params["name"],
                username: (params["username"]),
                email: params["email"]

    redirect_to "/users/#{user.id}", notice: "Account updated."
  end

end
