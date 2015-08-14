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

def edit
 @pet = Pet.find(params[:id])
 @user = User.find(params[:id])
end

def update

end

def show
  @pet = Pet.find(params[:id])
  @user = User.find(params[:id])#we will be assuming 1 to 1 user pet generation until establish otherwise
end

private

def user_params(user)
  params.require(:user).permit(:name,:email,:phone)
end

def pet_params(pet)
  params.require(:pet).permit(:animal_type,:size,:breed,:gender,:color,:lost_date,:name,:found_location)
end

end
