class DbController < ApplicationController
  def home
    @groups = Group.order("name ASC")
    @people = Person.order("last_name ASC")
  end

  def group
    @group = Group.find(params[:id])
    if !@group
      redirect_to "/"
    end
  end
  def person
    @person = Person.find(params[:id])
    if !@person
      redirect_to "/"
    end
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
        if params[:persons]
          params[:persons].each do |a|
            con = Connection.new
            con.group_id = @group.id
            con.person_id = a
            con.save
          end
        end

        redirect_to "/group/"+@group.id.to_s
      else
        render "new_group"
      end
    end
  end

  def update_group
    if params[:group]
      @persons = Person.all
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
        if params[:persons]
          params[:persons].each do |a|
            con = Connection.new
            con.group_id = @group.id
            con.person_id = a
            con.save
          end
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
      params[:person][:password]=Digest::SHA1.hexdigest("m1ddVC")
      @person = Person.new(params[:person])
      if @person.save


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

        # Connection Code
        # Check to see if the connection has been deleted
        @person.connections.each do |c|
          exists = false
          if params[:connection]
            params[:connection].each do |d|
              if d[:id] == c.id
                exists = true
              end
            end
          end
          if !exists
            c.destroy
          end
        end
        if params[:connection]
          params[:connection].each do |c|
            if c[:role] != "" and c[:group] != ""
              if c[:id] and c[:id] != ""
                con = Connection.find(c[:id])
              else
                con = Connection.new
              end
              con.role = c[:role]
              con.group_id = c[:group]
              con.person_id = @person.id
              con.start_date = Date::strptime(c[:start_month]+"/"+c[:start_year], "%m/%Y").to_datetime
              con.end_date = Date::strptime(c[:end_month]+"/"+c[:end_year], "%m/%Y").to_datetime
              con.save
            end
          end
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
      if @person.update_attributes params[:person]

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
        # Connection Code
        # Check to see if the connection has been deleted
        @person.connections.each do |c|
          exists = false
          if params[:connection]
            params[:connection].each do |d|
              if d[:id] == c.id.to_s
                exists = true
              end
            end
          end
          if !exists
            c.destroy
          end
        end
        if params[:connection]
          params[:connection].each do |c|
            if c[:role] != "" and c[:group] != ""
              if c[:id] and c[:id] != ""
                con = Connection.find(c[:id])
              else
                con = Connection.new
              end
              con.role = c[:role]
              con.group_id = c[:group]
              con.person_id = @person.id
              con.start_date = Date::strptime(c[:start_month]+"/"+c[:start_year], "%m/%Y").to_datetime
              con.end_date = Date::strptime(c[:end_month]+"/"+c[:end_year], "%m/%Y").to_datetime
              con.save
            end
          end
        end
        redirect_to "/person/"+@person.id.to_s
      else
        render "new_person"
      end
    end
  end
end
