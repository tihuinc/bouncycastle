class ResourcesController < ApplicationController

  before_filter :find_subject
  before_filter :find_resource, :except => [:new, :create]

  # GET /resources
  # GET /resources.xml
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.xml
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resource }
    end
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.xml
  def create
    @resource = @subject.resources.build(params[:resource])

    respond_to do |format|
      if @resource.save
        flash[:notice] = 'Resource was successfully created.'
        format.html { redirect_to(@subject) }
        format.xml  { render :xml => @resource, :status => :created, :location => @resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.xml
  def update
    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        flash[:notice] = 'Resource was successfully updated.'
        format.html { redirect_to(@resource) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.xml
  def destroy
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to(@subject) }
      format.xml  { head :ok }
    end
  end

  def upvote
    @resource.votes.build(:up => true).save
    redirect_to @subject
  end

  def downvote
    @resource.votes.build(:up => false).save
    redirect_to @subject
  end

  private
    def find_subject
      @subject = Subject.find(params[:subject_id])
    end

    def find_resource
      @resource = Resource.find(params[:id])
    end
end
