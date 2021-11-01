class UsersController < ApplicationController
before_action :ensure_correct_user, only:[:edit, :update]

  def index
    @user = current_user
    @book_new = Book.new
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.bookscd
  end

  def edit
    @user = User.find(params[:id])
    @users = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice]='You have updated user successfully.'
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
   redirect_to user_path(current_user.id)
    end
  end
end