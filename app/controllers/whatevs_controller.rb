class WhatevsController < ApplicationController

  def api
    @whatevs = Whatev.all
    respond_to do |format|
      format.html { render :layout => false }
      format.json { render :json => @whatevs.as_json(:only => ['foo', 'bar']) }
    end
  end

  # GET /whatevs
  # GET /whatevs.json
  def index
  end

  # GET /whatevs/1
  # GET /whatevs/1.json
  def show
    @whatev = Whatev.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @whatev }
    end
  end

  # GET /whatevs/new
  # GET /whatevs/new.json
  def new
    @whatev = Whatev.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @whatev }
    end
  end

  # GET /whatevs/1/edit
  def edit
    @whatev = Whatev.find(params[:id])
  end

  # POST /whatevs
  # POST /whatevs.json
  def create
    @whatev = Whatev.new(params[:whatev])

    respond_to do |format|
      if @whatev.save
        format.html { redirect_to @whatev, :notice => 'Whatev was successfully created.' }
        format.json { render :json => @whatev, :status => :created, :location => @whatev }
      else
        format.html { render :action => "new" }
        format.json { render :json => @whatev.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /whatevs/1
  # PUT /whatevs/1.json
  def update
    @whatev = Whatev.find(params[:id])

    respond_to do |format|
      if @whatev.update_attributes(params[:whatev])
        format.html { redirect_to @whatev, :notice => 'Whatev was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @whatev.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /whatevs/1
  # DELETE /whatevs/1.json
  def destroy
    @whatev = Whatev.find(params[:id])
    @whatev.destroy

    respond_to do |format|
      format.html { redirect_to whatevs_url }
      format.json { head :ok }
    end
  end
end
