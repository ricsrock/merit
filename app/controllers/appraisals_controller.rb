class AppraisalsController < ApplicationController
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  # GET /appraisals
  # GET /appraisals.json
  def index
    @q = Appraisal.accessible_to_user(current_user).page(params[:page]).search(params[:q])
    @appraisals = @q.result(:distinct => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appraisals }
    end
  end

  # GET /appraisals/1
  # GET /appraisals/1.json
  def show
    @appraisal = Appraisal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appraisal }
    end
  end

  # GET /appraisals/new
  # GET /appraisals/new.json
  def new
    @appraisal = Appraisal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appraisal }
    end
  end

  # GET /appraisals/1/edit
  def edit
    @appraisal = Appraisal.find(params[:id])
  end

  # POST /appraisals
  # POST /appraisals.json
  def create
    @appraisal = Appraisal.new(params[:appraisal])

    respond_to do |format|
      if @appraisal.save
        format.html { redirect_to @appraisal, notice: 'Appraisal was successfully created.' }
        format.json { render json: @appraisal, status: :created, location: @appraisal }
      else
        format.html { render action: "new" }
        format.json { render json: @appraisal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appraisals/1
  # PUT /appraisals/1.json
  def update
    @appraisal = Appraisal.find(params[:id])

    respond_to do |format|
      if @appraisal.update_attributes(params[:appraisal])
        format.html { redirect_to @appraisal, notice: 'Appraisal was successfully updated.' }
        format.json { head :no_content }
      else
        #flash[:notice] = @appraisal.errors.full_messages
        format.html { render action: "edit" }
        format.json { render json: @appraisal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisals/1
  # DELETE /appraisals/1.json
  def destroy
    @appraisal = Appraisal.find(params[:id])
    @appraisal.destroy

    respond_to do |format|
      format.html { redirect_to appraisals_url }
      format.json { head :no_content }
    end
  end
  
  def perform
    @appraisal = Appraisal.find(params[:id])
    @appraisal.create_responses
  end
  
  def setup_batch
    
  end
  
  def create_batch
    @review_period = ReviewPeriod.find_by_id(params[:appraisal_batch][:review_period_id])
    if @review_period
      flash[:notice] = "Review Period was happily found! All possible appraisals were created."
      @review_period.batch_create_appraisals
    else
      flash[:error] = "You must choose a review period! Could not create appraisals."
    end
    redirect_to appraisals_url
  end
  
  def view
    @appraisal = Appraisal.find(params[:id])
  end
  
  def review
    @appraisal = Appraisal.find(params[:id])
  end
  
  def approve
    @appraisal = Appraisal.find(params[:id])
    @appraisal.approve!(current_user.login)
  end
  
  def unapprove
    @appraisal = Appraisal.find(params[:id])
    @appraisal.unapprove!
  end
  
end
