class BooksController < ApplicationController
  def index
    @authors = Author.all
    if params[:search].present?
      @books = Book.includes(:author, :genre, :publishers)
                   .search(params[:search], params[:author_id])
                   .page(params[:page]).per(50)
      @no_results = @books.empty?
    else
      @books = Book.includes(:author, :genre, :publishers)
                   .page(params[:page]).per(50)
    end
    render 'books'
  end

  def show
    @book = Book.find(params[:id])
  end
end
