class PrerequisitesController < ApplicationController
  before_filter :find_subject, :only => [:index, :new, :create, :destroy]

  # GET /prerequisites
  # GET /prerequisites.xml
  def index
    @prerequisites = @subject.prerequisites

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prerequisites }
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

  # POST /prerequisites
  # POST /prerequisites.xml
  def create
    @prerequisite = @subject.prerequisites.build(:prereq_id => params[:prereq_id])

    respond_to do |format|
      if @prerequisite.save
        flash[:notice] = 'Prerequisite was successfully created.'
        format.html { redirect_to(@subject) }
        format.xml  { render :xml => @prerequisite, :status => :created, :location => @prerequisite }
      else
        flash[:error] = 'There was a problem creating the prerequisite'
        format.html { redirect_to(@subject) }
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
      flash[:notice] = 'Prerequisite successfully destroyed'
      format.html { redirect_to(subject_path(@subject)) }
      format.xml  { head :ok }
    end
  end

  private
    def find_subject
      @subject = Subject.find(params[:subject_id])
    end
end
