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
      if @dog.save!
        redirect_to dog_path(@dog)
      else
        render :new
      end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :color, :size, :is_sterilized, :rating, :comments)
  end
end
