class PrerequisitesController < ApplicationController
  # GET /prerequisites
  # GET /prerequisites.xml
  def index
    @prerequisites = Prerequisite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prerequisites }
    end
  end

  # GET /prerequisites/1
  # GET /prerequisites/1.xml
  def show
    @prerequisite = Prerequisite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prerequisite }
    end
  end

  # GET /prerequisites/new
  # GET /prerequisites/new.xml
  def new
    @prerequisite = Prerequisite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prerequisite }
    end
  end

  # GET /prerequisites/1/edit
  def edit
    @prerequisite = Prerequisite.find(params[:id])
  end

  # POST /prerequisites
  # POST /prerequisites.xml
  def create
    @prerequisite = Prerequisite.new(params[:prerequisite])

    respond_to do |format|
      if @prerequisite.save
        flash[:notice] = 'Prerequisite was successfully created.'
        format.html { redirect_to(@prerequisite) }
        format.xml  { render :xml => @prerequisite, :status => :created, :location => @prerequisite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prerequisite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prerequisites/1
  # PUT /prerequisites/1.xml
  def update
    @prerequisite = Prerequisite.find(params[:id])

    respond_to do |format|
      if @prerequisite.update_attributes(params[:prerequisite])
        flash[:notice] = 'Prerequisite was successfully updated.'
        format.html { redirect_to(@prerequisite) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prerequisite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prerequisites/1
  # DELETE /prerequisites/1.xml
  def destroy
    @prerequisite = Prerequisite.find(params[:id])
    @prerequisite.destroy

    respond_to do |format|
      format.html { redirect_to(prerequisites_url) }
      format.xml  { head :ok }
    end
  end
end
