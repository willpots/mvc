class UserMailer < ActionMailer::Base
  default from: "admin@middventures.com"

  def welcome_email person
    @person = person
    @url = "http://www.middventures.com/login"
    mail :to => person.email, :subject => "Welcome to www.middventures.com"
  end

  def recover_password person
    @person = person
    @token = Digest::SHA1.hexdigest(Time.now.to_s+"m1ddVC"+@person.id.to_s)
    @person.password_token = @token
    if @person.save
      @url = "http://www.middventures.com/recover/"+@token
      mail :to => person.email, :subject => "Recover your Password"
    end
  end
end

