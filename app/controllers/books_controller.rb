class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      @user = current_user
      @books = Book.all
      render :"index"
    end
  end

    def update
      @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to book_path(@book.id)
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
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end