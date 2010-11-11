class CourseworksController < ApplicationController
  # GET /courseworks
  # GET /courseworks.xml
  def index
    @courseworks = Coursework.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @courseworks }
    end
  end

  # GET /courseworks/1
  # GET /courseworks/1.xml
  def show
    @coursework = Coursework.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coursework }
    end
  end

  # GET /courseworks/new
  # GET /courseworks/new.xml
  def new
    @coursework = Coursework.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coursework }
    end
  end

  # GET /courseworks/1/edit
  def edit
    @coursework = Coursework.find(params[:id])
  end

  # POST /courseworks
  # POST /courseworks.xml
  def create
    @coursework = Coursework.new(params[:coursework])

    respond_to do |format|
      if @coursework.save
        flash[:notice] = 'Coursework was successfully created.'
        format.html { redirect_to(@coursework) }
        format.xml  { render :xml => @coursework, :status => :created, :location => @coursework }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coursework.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courseworks/1
  # PUT /courseworks/1.xml
  def update
    @coursework = Coursework.find(params[:id])

    respond_to do |format|
      if @coursework.update_attributes(params[:coursework])
        flash[:notice] = 'Coursework was successfully updated.'
        format.html { redirect_to(@coursework) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coursework.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courseworks/1
  # DELETE /courseworks/1.xml
  def destroy
    @coursework = Coursework.find(params[:id])
    @coursework.destroy

    respond_to do |format|
      format.html { redirect_to(courseworks_url) }
      format.xml  { head :ok }
    end
  end
end
