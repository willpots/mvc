class NewsController < ApplicationController
  def home
  	@articles = Article.find(:all, :order => "id desc", :limit => 8)


  end

  def article
  	@article = Article.find(params[:id])



  end

  def create


  end

  def insert
  	@article = Article.new

  	@article.title = params[:title]
  	@article.body = params[:body]
  	@article.person = Person.find(1)

  	if @article.save and @article.title != "" and @article.body != ""
  		redirect_to "/article/"+ @article.id.to_s
  	else
  		redirect_to "/error"
  	end

  end

end
