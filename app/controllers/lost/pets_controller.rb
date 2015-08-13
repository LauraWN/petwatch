class Lost::PetsController < ApplicationController

def new
 @pets = Pet.new
 @users = User.new
end

def create

end

def show
  @pet = Pet.find(params[:id])
end



end
