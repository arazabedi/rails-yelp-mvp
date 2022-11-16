class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  # List restaurants
  def index
    @restaurants = Restaurant.all
  end

  # Show particular page
  def show
    @restaurant ||= Restaurant.find(params[:id])
  end

  # Get new Restaurant
  def new
    @restaurant = Restaurant.new
  end

  # Post new restaurant
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "#{@restaurant.name} saved to database."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Delete restaurant
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed"
  end

  def edit
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
