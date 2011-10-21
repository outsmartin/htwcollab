class CodesnippetsController < ApplicationController
  # GET /codesnippets
  # GET /codesnippets.json
  def index
    @codesnippets = Codesnippet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @codesnippets }
    end
  end

  # GET /codesnippets/1
  # GET /codesnippets/1.json
  def show
    @codesnippet = Codesnippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @codesnippet }
    end
  end

  # GET /codesnippets/new
  # GET /codesnippets/new.json
  def new
    @codesnippet = Codesnippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @codesnippet }
    end
  end

  # GET /codesnippets/1/edit
  def edit
    @codesnippet = Codesnippet.find(params[:id])
  end

  # POST /codesnippets
  # POST /codesnippets.json
  def create
    @codesnippet = Codesnippet.new(params[:codesnippet])

    respond_to do |format|
      if @codesnippet.save
        format.html { redirect_to @codesnippet, notice: 'Codesnippet was successfully created.' }
        format.json { render json: @codesnippet, status: :created, location: @codesnippet }
      else
        format.html { render action: "new" }
        format.json { render json: @codesnippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /codesnippets/1
  # PUT /codesnippets/1.json
  def update
    @codesnippet = Codesnippet.find(params[:id])

    respond_to do |format|
      if @codesnippet.update_attributes(params[:codesnippet])
        format.html { redirect_to @codesnippet, notice: 'Codesnippet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @codesnippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codesnippets/1
  # DELETE /codesnippets/1.json
  def destroy
    @codesnippet = Codesnippet.find(params[:id])
    @codesnippet.destroy

    respond_to do |format|
      format.html { redirect_to codesnippets_url }
      format.json { head :ok }
    end
  end
end
