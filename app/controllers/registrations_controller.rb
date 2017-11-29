class RegistrationsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)

		if user
			user.save
			redirect_to user_path(user)
		else
			redirect_to '/signup'
		end
	end

end