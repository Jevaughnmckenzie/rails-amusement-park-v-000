class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	
  		user = User.find_by(name: user_params[:name])

  	if user 
  		session[:user_id] = user.id

  		redirect_to user_path(user)
  	else
  		redirect_to '/signin'
  	end
  end

  def destroy
  	if current_user.present?
  		session.delete(:user_id)
  	end

  	redirect_to '/'
  end
end
