class RestaurantsController < ApplicationController
	def index
	  @restaurants = Restaurant.all
	end

	def new
	  @restaurant = Restaurant.new
		render layout: false if request.xhr?
	end

	def create
	  @restaurant = Restaurant.new(restaurant_params)
		@restaurant.save
		redirect_to restaurants_url
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant = @restaurant.update_attributes(restaurant_params)
		redirect_to restaurants_url
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		render layout: false if request.xhr?
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_url
	end

	private
	def restaurant_params
	    params.require(:restaurant).permit(:id, :address, :city, :description, :name, :phone)
	end
end
