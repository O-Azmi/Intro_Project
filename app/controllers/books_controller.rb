class BooksController < ApplicationController
    def index
      @books = Book.includes(:author, :genre, :publishers).all
      render 'books' 
    end
    def show
      @book = Book.find(params[:id])
    end    
  end