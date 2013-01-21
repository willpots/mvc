class DbController < ApplicationController
  def home
  end

  def group
  	@group = Group.find(params[:id])
  end

  def person
  	@person = Person.find(params[:id])  	
  end

  def edit_group 
  	@group = Group.find(params[:id])

  end
  def update_group
  	if params[:group]
  		@group = Group.new(params[:group])
  		if @group.save
  			redirect_to "/group/"+@group.id.to_s
  		else
  			redirect_to "/group/"+@group.id.to_s+"/edit"
  		end
  	end	
  end
end
