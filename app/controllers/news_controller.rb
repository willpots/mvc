class NewsController < ApplicationController
  def home
  	@articles = Article.find(:all, :order => "id desc", :limit => 8)


  end

  def article
  	@article = Article.find(params[:id])



  end

  def create
    @groups = Group.all
    @people = Person.all


  end
  def delete 
    logger.debug @user
    if params[:id] and @user and @user.author
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to "/"
    else
      redirect_to "/"
    end
  end
  def insert
  	@article = Article.new

  	@article.title = params[:title]
  	@article.body = params[:body]
  	@article.person = Person.find(1)

  	if @article.save and @article.title != "" and @article.body != ""
      Reference.where(:article_id => @article.id).each do |d|
        d.destroy
      end
      if params[:persons]
        params[:persons].each do |p|
          r = Reference.new
          r.person_id = p
          r.article_id = @article.id
          r.save
        end
      end
      if params[:groups]
        params[:groups].each do |g|
          r = Reference.new
          r.group_id = g
          r.article_id = @article.id
          r.save
        end
      end
  		redirect_to "/article/"+ @article.id.to_s
  	else
  		redirect_to "/error"
  	end

  end

end
