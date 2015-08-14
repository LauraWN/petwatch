class UsersController < ApplicationController

  def index
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

#def delete/destroy
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to lost_pets_path #they might as well look at lost pets
  end
end
