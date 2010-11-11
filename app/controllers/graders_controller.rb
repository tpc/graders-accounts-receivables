class GradersController < ApplicationController
  # GET /graders
  # GET /graders.xml
  def index
    @graders = Grader.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @graders }
    end
  end

  # GET /graders/1
  # GET /graders/1.xml
  def show
    @grader = Grader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grader }
    end
  end

  # GET /graders/new
  # GET /graders/new.xml
  def new
    @grader = Grader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grader }
    end
  end

  # GET /graders/1/edit
  def edit
    @grader = Grader.find(params[:id])
  end

  # POST /graders
  # POST /graders.xml
  def create
    @grader = Grader.new(params[:grader])

    respond_to do |format|
      if @grader.save
        flash[:notice] = 'Grader was successfully created.'
        format.html { redirect_to(@grader) }
        format.xml  { render :xml => @grader, :status => :created, :location => @grader }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grader.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /graders/1
  # PUT /graders/1.xml
  def update
    @grader = Grader.find(params[:id])

    respond_to do |format|
      if @grader.update_attributes(params[:grader])
        flash[:notice] = 'Grader was successfully updated.'
        format.html { redirect_to(@grader) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grader.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /graders/1
  # DELETE /graders/1.xml
  def destroy
    @grader = Grader.find(params[:id])
    @grader.destroy

    respond_to do |format|
      format.html { redirect_to(graders_url) }
      format.xml  { head :ok }
    end
  end
end
