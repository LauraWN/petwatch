class Lost::PetsController < ApplicationController

  def new
    @pets = Pet.new
    @users = User.new
  end

  def create
    @user = User.create(user_params(params[:user]))
    @pet = Pet.create(pet_params(params[:pet]))
    redirect_to [:lost,@pet]
  end

  def edit #again assuming right now that 1 to 1 :id association user to pet
    @pets = Pet.find(params[:id])
    @users = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @pet = Pet.find(params[:id])
    if( @user.update(user_params(params[:user])) && @pet.update(pet_params(params[:pet])) )
      redirect_to [:lost,@pet]
    else
      render 'edit'
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @user = User.find(params[:id])#we will be assuming 1 to 1 user pet generation until establish otherwise
  end

#def delete/destroy
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to lost_pets_path
  end

private

  def user_params(user)
    params.require(:user).permit(:name,:email,:phone)
  end

  def pet_params(pet)
    params.require(:pet).permit(:animal_type,:size,:breed,:gender,:color,:lost_date,:name,:found_location)
  end

end
