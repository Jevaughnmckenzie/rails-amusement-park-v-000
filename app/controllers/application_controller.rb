class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	session[:user_id]
  end

  private

	def user_params
		raise params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password).inspect
	end

end
