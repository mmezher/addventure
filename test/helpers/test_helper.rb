ENV['RAILS_ENV'] ||= 'test'

class ActiveSupport::TestCase fixtures :all? 

	#returns true if user is logged in (test)

	def is_logged_in?
		!session[:user_id].nil?
	end
end