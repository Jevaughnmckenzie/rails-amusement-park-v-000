class UsersController < ApplicationController

	before_action :block_guest, only: [:show]
	before_action :set_user, only: [:show]


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
		 
	end

	private 

	def set_user
		@user = User.find(current_user.id)
	end

	def block_guest
		redirect_to '/' unless logged_in?
	end

end
