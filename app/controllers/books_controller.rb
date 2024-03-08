class BooksController < ApplicationController
  def index
    @books = Book.includes(:author, :genre, :publishers).page(params[:page]).per(50)
    render 'books'
  end

  def show
    @book = Book.find(params[:id])
  end
end