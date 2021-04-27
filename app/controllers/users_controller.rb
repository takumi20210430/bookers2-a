class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
     @user = User.find(params[:id])
  end
end
