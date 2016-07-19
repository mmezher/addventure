class PagesController < ApplicationController

	def show
		render template: "pages/#{params[:page]}"
	end 
	def about
	end
	def home
	end
	def add
	end
	def browse
	end
	def plan
	end
	def login
	end

	
end 