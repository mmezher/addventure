class UsersController < ApplicationController

def new
end
def show
	@user = User.find(params[:id])
	#debugger put this in to see problems. uses byebug gem
end
end