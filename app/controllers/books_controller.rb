class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

  if @book.save
    redirect_to books_path
    # redirect_to controller: :products, action: :index

  else
    render :new
  end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  if
    @book.save
    flash[:notice] = "Signed out successfully！"
    redirect_to books_path
  else
    render books_path
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
    e

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end