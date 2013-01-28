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
    if params[:group]
      @group = Group.new(params[:group])
      if @group.save

        # Picture Uploading Code
        if params[:pictureField]
          fileExt=false
          if params[:pictureField].content_type == "image/jpeg"
            fileExt=".jpg"
          elsif params[:pictureField].content_type == "image/gif"
            fileExt=".gif"
          elsif params[:pictureField].content_type == "image/png"
            fileExt=".png"
          end
          if fileExt
            picture = Digest::SHA1.hexdigest(@group.id.to_s+"mvc2")+fileExt
            AWS::S3::S3Object.store( picture, params[:pictureField].read, AMAZON_BUCKET, :content_type => 'image/jpeg', :access => :public_read )
            @group.picture = picture
            @group.save
          end
        end

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
    if params[:group]
      @group = Group.find(params[:id])
      if @group.update_attributes params[:group]


        # Picture Uploading Code
        if params[:pictureField]
          fileExt=false
          if params[:pictureField].content_type == "image/jpeg"
            fileExt=".jpg"
          elsif params[:pictureField].content_type == "image/gif"
            fileExt=".gif"
          elsif params[:pictureField].content_type == "image/png"
            fileExt=".png"
          end
          if fileExt
            picture = Digest::SHA1.hexdigest(@group.id.to_s+"mvc2")+fileExt
            AWS::S3::S3Object.store( picture, params[:pictureField].read, AMAZON_BUCKET, :content_type => 'image/jpeg', :access => :public_read )
            @group.picture = picture
            @group.save
          end
        end

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
        render "edit_group"
      end
    end
  end


  def edit_person
    @person = Person.find(params[:id])
    @groups = Group.all
  end
  def new_person
    @person = Person.new
    @groups = Group.all
  end
  def create_person
    if params[:person]
      @person = Person.new(params[:person])
      if @person.save
        @person.connections.each do |c|
          c.destroy
        end

        # Picture Uploading Code
        if params[:pictureField]
          fileExt=false
          if params[:pictureField].content_type == "image/jpeg"
            fileExt=".jpg"
          elsif params[:pictureField].content_type == "image/gif"
            fileExt=".gif"
          elsif params[:pictureField].content_type == "image/png"
            fileExt=".png"
          end
          if fileExt
            picture = Digest::SHA1.hexdigest(@person.id.to_s+"mvc")+fileExt
            AWS::S3::S3Object.store( picture, params[:pictureField].read, AMAZON_BUCKET, :content_type => 'image/jpeg', :access => :public_read )
            @person.picture = picture
            @person.save
          end
        end

        params[:groups].each do |a|
          con = Connection.new
          con.person_id = @person.id
          con.group_id = a
          con.save
        end
        redirect_to "/person/"+@person.id.to_s
      else
        render "new_person"
      end
    end
  end
  def update_person
    if params[:person]
      @person = Person.find(params[:id])
      if @person.update_attributes params[:group]
        @person.connections.each do |c|
          c.destroy
        end
        # Picture Uploading Code
        if params[:pictureField]
          fileExt=false
          if params[:pictureField].content_type == "image/jpeg"
            fileExt=".jpg"
          elsif params[:pictureField].content_type == "image/gif"
            fileExt=".gif"
          elsif params[:pictureField].content_type == "image/png"
            fileExt=".png"
          end
          if fileExt
            picture = Digest::SHA1.hexdigest(@person.id.to_s+"mvc")+fileExt
            AWS::S3::S3Object.store( picture, params[:pictureField].read, AMAZON_BUCKET, :content_type => 'image/jpeg', :access => :public_read )
            @person.picture = picture
            @person.save
          end
        end
        params[:groups].each do |a|
          con = Connection.new
          con.person_id = @person.id
          con.group_id = a
          con.save
        end
        redirect_to "/person/"+@person.id.to_s
      else
        render "new_person"
      end
    end
  end
end
