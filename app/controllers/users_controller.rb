class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books

    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)

  if
    @user.save
    flash[:notice] = "Signed out successfully！"
    redirect_to users_path
  else
    render users_path
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end

  # if
    # @user.save
    # flash[:notice] = "Signed out successfully！"
    # redirect_to("/users/index")
  # else
    # render("users/edit")
  # end
  # end