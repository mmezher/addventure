class AccountActivationsController < ApplicationController

def edit 
	user = User.find_by(email: params[:email])
	if user && !user.activated? && user.authenticated?(:activation, params[:id])
		user.activate
		log_in user
		flash[:success] = "Account is now activated."
		redirect_to root_url
	else
		flash[:danger] = "Invalid activation link. Try again or contact the administrator"
		redirect_to root_url
	end
end
end 