class AttractionsController < ApplicationController

	before_action :set_attraction, only: [:show, :edit, :update]

	def index
		set_user
		@attractions = Attraction.all
	end

	def new
		@attraction = Attraction.new
	end

	def show
		@user = current_user
	end

	def create
		@attraction = Attraction.new(attraction_params)

		if @attraction.save
			redirect_to attraction_path(@attraction)
		else
			redirect_to new_attraction_path
		end
	end

	def edit
	end

	def update
		if @attraction.update(attraction_params)
			redirect_to attraction_path(@attraction)
		else
			redirect_to edit_attraction_path
		end

	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end

end