class IinesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    iine = current_user.iines.new(book_id: book.id)
    iine.save
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:book_id])
    iine = current_user.iines.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(book)
  end
end
