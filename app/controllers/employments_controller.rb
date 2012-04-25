class EmploymentsController < ApplicationController
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  # GET /employments
  # GET /employments.json
  def index
    @employments = Employment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employments }
    end
  end

  # GET /employments/1
  # GET /employments/1.json
  def show
    @employment = Employment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employment }
    end
  end

  # GET /employments/new
  # GET /employments/new.json
  def new
    @employment = Employment.new
    @person = Person.find(params[:person_id]) if params[:person_id]
    @store = Store.find(params[:store_id]) if params[:store_id]
    @resource = @person || @store
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employment }
      format.js
    end
  end

  # GET /employments/1/edit
  def edit
    @employment = Employment.find(params[:id])
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = Employment.new(params[:employment])
    @resource_type = params[:employment][:resource_type]
    @resource_type == "Store" ? @store = @employment.store : @person = @employment.person
    respond_to do |format|
      if @employment.save
        format.js
        format.html { redirect_to @employment, notice: 'Employment was successfully created.' }
        format.json { render json: @employment, status: :created, location: @employment }
      else
        format.html { render action: "new" }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employments/1
  # PUT /employments/1.json
  def update
    @employment = Employment.find(params[:id])

    respond_to do |format|
      if @employment.update_attributes(params[:employment])
        format.html { redirect_to @employment, notice: 'Employment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    session[:original_uri] = request.referer
    @employment = Employment.find(params[:id])
    @employment.destroy

    respond_to do |format|
      format.html { redirect_to session[:original_uri] }
      format.json { head :no_content }
    end
  end
  
  def end
    session[:original_uri] = request.referer
    @employment = Employment.find(params[:id])
    @employment.update_attribute(:end_date, Date.today)
    redirect_to session[:original_uri]
  end
  
  def set_dates
    @employment = Employment.find(params[:id])
    session[:original_uri] = request.referer
  end
  
  def custom_dates
    @employment = Employment.find(params[:id])
    @employment.update_attributes(params[:employment])
    flash[:notice] = "Employment dates have been updated."
    redirect_to session[:original_uri]
  end
  
  def cancel
    
  end
end
