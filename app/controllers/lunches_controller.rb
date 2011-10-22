class LunchesController < ApplicationController
  # GET /lunches
  # GET /lunches.json
  def index
    @lunches = Lunch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lunches }
    end
  end

  # GET /lunches/1
  # GET /lunches/1.json
  def show
    @lunch = Lunch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lunch }
    end
  end

  # GET /lunches/new
  # GET /lunches/new.json

  # GET /lunches/1/edit
  def edit
    @lunch = Lunch.find(params[:id])
  end

  # POST /lunches
  # POST /lunches.json

  # PUT /lunches/1
  # PUT /lunches/1.json
  def update
    @lunch = Lunch.find(params[:id])

    respond_to do |format|
      if @lunch.update_attributes(params[:lunch])
        format.html { redirect_to @lunch, notice: 'Lunch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lunch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lunches/1
  # DELETE /lunches/1.json
  def destroy
    @lunch = Lunch.find(params[:id])
    @lunch.destroy

    respond_to do |format|
      format.html { redirect_to lunches_url }
      format.json { head :ok }
    end
  end
end
