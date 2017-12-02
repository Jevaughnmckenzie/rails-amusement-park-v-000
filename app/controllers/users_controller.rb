class UsersController < ApplicationController

	before_action :block_guest, only: [:show, :edit]
	before_action :set_user, only: [:show, :edit, :update]
	before_action :block_logged_user, only: [:new]
	after_action :clear_user_messages, only: [:show]

	def new 
		@user = User.new
	end

	def create
		user = User.new(user_params)

		if user
			user.save
			# binding.pry
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			redirect_to '/users/new'
		end
	end

	def show
		# raise @user.inspect
		 # raise @user.messages.inspe
	end

	def update
	
		ride = Ride.new(user: @user, attraction: Attraction.find(params[:user][:attraction]))
		ride.take_ride
		# raise @user.messages.inspect
		redirect_to user_path(@user)
	end

	private 

	

	def block_guest
		redirect_to '/' unless logged_in?
	end

	def clear_user_messages
		current_user.messages = ""
		current_user.save
	end
	

end
