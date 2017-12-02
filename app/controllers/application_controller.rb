class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  

  def logged_in?
  	!!current_user
  end


  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin, :attraction)
	end

  def block_logged_user
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
