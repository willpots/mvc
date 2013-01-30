class LoginController < ApplicationController
  def login
  end

  def validate
    if params[:username] and params[:password]
      if params[:password] == ""
        params[:password] = nil
      else
        params[:password]=Digest::SHA1.hexdigest(params[:password]+"m1ddVC")
      end
      @person = Person.where(:email => params[:username], :password => params[:password])

      if !@person.empty?
        session[:user]=@person[0][:email]
        session[:user_id]=@person[0][:id]

        redirect_to "/"
      else
        @error = "Could not find username/password combination"
        render "login"
      end
    else
      redirect_to "/"
    end
  end

  def register
  end

  def create
    if params[:username] and params[:password]
      @person = Person.new
      @person.first_name = params[:first_name]
      @person.last_name = params[:last_name]
      @person.email = params[:username]
      @person.password = Digest::SHA1.hexdigest(params[:password]+"m1ddVC")

      if @person.save
        session[:user]=@person.email
        session[:user_id]=@person.id

        redirect_to "/person/"+ @person.id.to_s + "/edit"
      else
        @error = "Could not register user."
        render "register"
      end
    else
      redirect_to "/"
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end
end
