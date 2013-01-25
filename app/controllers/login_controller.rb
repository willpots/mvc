class LoginController < ApplicationController
  def login
  end
  
  def validate
  	if params[:username] and params[:password]
  		@person = Person.where(:email => params[:username], :password => params[:password])
  		logger.debug @person.to_json
  		if !@person.empty?
  			session[:user]=@person[0][:email]
  			session[:user_id]=@person[0][:id]

 			redirect_to "/"
  		else
  			render "login#login"
  		end
  	else
  		redirect_to "/"
  	end
  end

  def register
  end

  def create
  end

  def logout
	reset_session
  	redirect_to "/"
  end
end
