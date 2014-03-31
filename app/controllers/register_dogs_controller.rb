class RegisterDogsController < ApplicationController

  def new
    @register_dog = RegisterDog.new
  end

  def create
    @register_dog = RegisterDog.new(dog_params)
    if @register_dog.save
      redirect_to '/register_dogs',
        notice: 'Dog registered.'
    else
      render action: 'new'
    end
  end

  def index
    @register_dogs = RegisterDog.all
  end

  def dog_params
    params.require(:register_dog).permit(:first_name, :last_name, :email, :dog_name)
  end

end
