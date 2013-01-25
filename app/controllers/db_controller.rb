class DbController < ApplicationController
  def home
  	@groups = Group.all
  	@people = Person.all
  end

  def group
    @group = Group.find(params[:id])
  end

  def person
    @person = Person.find(params[:id])
  end

  def edit_group
    @group = Group.find(params[:id])
    @people = Person.all
  end
  def create_group
    if params[:group]
      @group = Group.new(params[:group])
      if @group.save
        redirect_to "/group/"+@group.id.to_s
      else
        redirect_to "/group/"+@group.id.to_s+"/edit"
      end
    end
  end
  def update_group
    if params[:group]
      @group = Group.find(params[:id])
      if @group.update_attributes params[:group]
        redirect_to "/group/"+@group.id.to_s
      else
        redirect_to "/group/"+@group.id.to_s+"/edit"
      end
    end
  end
  def edit_person


  end
  def update_person


  end
end
