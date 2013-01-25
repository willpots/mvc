class ApplicationController < ActionController::Base
  protect_from_forgery



  before_filter :verify
  def verify
    if session[:user_id]
      @user = Person.find(session[:user_id])
    end

    # @controller = path[:controller]
    # @action = path[:action]
    @action = action_name
    @controller = controller_name

    @create_link = "not-active"
    @db_link = "not-active"
    @news_link = "not-active"

    if @controller == "news" and @action == "create"
      @create_link = "active"
    elsif @controller == "news"
      @news_link = "active"
    elsif @controller == "db"
      @db_link = "active"
    end

  end

end
