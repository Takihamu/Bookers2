class BooksController < ApplicationController
  before_action :ensure_correct_user, only:[:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
      else
        render :edit
      end
    end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @favorite = Favorite.new
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render :edit
    end
  end

  def edit
   @book = Book.find(params[:id])
   @books = Book.new
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
   redirect_to books_path
    end
  end
end