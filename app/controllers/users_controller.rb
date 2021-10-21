class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @book_new = Book.new
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @users = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end