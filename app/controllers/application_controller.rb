class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :verifyuser
	def verifyuser
		if session[:user_id]
			@user = Person.find(session[:user_id])
		end
	end

end
