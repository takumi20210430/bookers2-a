class BooksController < ApplicationController
  before_action :baria_user, only: [:edit]
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="you have created book successfully."
      redirect_to book_path(@book)
    else 
      @user = current_user
      @books = Book.all
      render :index
    end
    
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="you have updated book successfully"
      redirect_to book_path(@book)
    else
      
      render :edit
    end
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
   def baria_user
      @book = Book.find(params[:id])
      @user = @book.user
        unless @user.id == current_user.id
          redirect_to books_path
        end
   end

end
