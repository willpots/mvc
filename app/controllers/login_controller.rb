require 'net/http'

class LoginController < ApplicationController
  def login
  end

  def validate
    if params[:username] and params[:password]

      params[:password]=Digest::SHA1.hexdigest(params[:password]+"m1ddVC")
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
        UserMailer.welcome_email(@person).deliver


        # user="middventures"
        # pass="MiddleburyVentures13"
        # string='http://sendgrid.com/api/newsletter/lists/email/add.json?list=Members&data={"email":"'+URI::escape(@person.email)+'","name":"'+URI::escape(@person.first_name)+" "+URI::escape(@person.last_name)+'"}&api_user='+user+'&api_key='+pass
        # url = URI.parse(URI.encode(string.strip))
        # req = Net::HTTP::Get.new(url.path)
        # res = Net::HTTP.start(url.host, url.port) {|http|
        #   http.request(req)
        # }
        # logger.debug res.body

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

  def forgot

  end

  def reset_password
    if params[:username]
      @person = Person.find_by_email(params[:username])
      if @person
        UserMailer.recover_password(@person).deliver
      end
    end
  end

  def recover
    if params[:token]
      @token = params[:token]
      @person = Person.find_by_password_token params[:token]
      if @person

      else
        redirect_to "404"
      end
    else
      redirect_to "404"
    end
  end
  def change_password
    if params[:token] and params[:password] and params[:password2] and params[:password] == params[:password2]
      @person = Person.find_by_password_token(params[:token])
      if @person
        @person.password = Digest::SHA1.hexdigest(params[:password]+"m1ddVC")
        @person.save
        @person.password_token = nil
        @person.save
        redirect_to "/login"
      end
    else
      redirect_to "404"
    end
  end
end
