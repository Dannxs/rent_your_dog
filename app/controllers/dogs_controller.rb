class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
      if @dog.save!
        redirect_to dog_path(@dog)
      else
        render :new
      end
  end

  def edit
    @dog = Dog.find(params[:id])
    if @dog.user != current_user
      redirect_to root_path
    end
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    if @dog.save!
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dashboard_path
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :age, :color, :size, :is_sterilized, :rating, :comments, :breed, photos: [])
  end
end
