class DbController < ApplicationController
  def home
    @groups = Group.order("name ASC")
    @people = Person.order("last_name ASC")
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
  def new_group
    @group = Group.new
    @people = Person.all

  end
  def create_group
    @people = Person.all
    if params[:group]
      @group = Group.new(params[:group])
      if @group.save
        @group.connections.each do |c|
          c.destroy
        end
        params[:persons].each do |a|
          con = Connection.new
          con.group_id = @group.id
          con.person_id = a
          con.save
        end


        redirect_to "/group/"+@group.id.to_s
      else
        render "new_group"
      end
    end
  end

  def update_group
    @people = Person.all
    if params[:group]
      @group = Group.find(params[:id])
      if @group.update_attributes params[:group]
        params[:persons].each do |a|
          con = Connection.new
          con.group_id = @group.id
          con.person_id = a
          con.save
        end
        redirect_to "/group/"+@group.id.to_s
      else
        render "edit_group"
      end
    end
  end

  def edit_person


  end
  def update_person


  end
end
