class ReceipesController < ApplicationController
  # GET /receipes
  # GET /receipes.json
  def index
    @receipes = Receipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receipes }
    end
  end

  # GET /receipes/1
  # GET /receipes/1.json
  def show
    @receipe = Receipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receipe }
    end
  end

  # GET /receipes/new
  # GET /receipes/new.json
  def new
    @receipe = Receipe.new
    @receipe.aromas.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receipe }
    end
  end

  # GET /receipes/1/edit
  def edit
    @receipe = Receipe.find(params[:id])
  end

  # POST /receipes
  # POST /receipes.json
  def create
    @receipe = Receipe.new(params[:receipe])

    respond_to do |format|
      if @receipe.save
        format.html { redirect_to @receipe, notice: 'Receipe was successfully created.' }
        format.json { render json: @receipe, status: :created, location: @receipe }
      else
        format.html { render action: "new" }
        format.json { render json: @receipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receipes/1
  # PUT /receipes/1.json
  def update
    @receipe = Receipe.find(params[:id])

    respond_to do |format|
      if @receipe.update_attributes(params[:receipe])
        format.html { redirect_to @receipe, notice: 'Receipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipes/1
  # DELETE /receipes/1.json
  def destroy
    @receipe = Receipe.find(params[:id])
    @receipe.destroy

    respond_to do |format|
      format.html { redirect_to receipes_url }
      format.json { head :no_content }
    end
  end
end
