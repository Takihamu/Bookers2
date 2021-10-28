class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.favorites.new(favorite_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
  end

  private
  def favorite_params
    params.require(:favorite).permit(:comment)
  end
end
