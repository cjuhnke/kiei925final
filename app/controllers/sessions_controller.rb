class SessionsController < ApplicationController

  def index

  end

  def show

  end

  def destroy
    reset_session
    redirect_to "/", notice: "You are signed out."
  end

  def new

  end

  def create
    user = User.find_by(email: params["email"])
    if user == nil
      redirect_to "/", notice: "Please sign up first."
    else
      if user.authenticate(params["password"])
        session["user_id"] = user.id
        redirect_to "/"
      else
        redirect_to "/", notice: "Nice try."
      end
    end
  end

  def edit

  end

  def update

  end

end