class Admin::ReviewPeriodsController < ApplicationController
  layout 'admin'
  # GET /review_periods
  # GET /review_periods.json
  def index
    @review_periods = ReviewPeriod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @review_periods }
    end
  end

  # GET /review_periods/1
  # GET /review_periods/1.json
  def show
    @review_period = ReviewPeriod.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review_period }
    end
  end

  # GET /review_periods/new
  # GET /review_periods/new.json
  def new
    @review_period = ReviewPeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review_period }
    end
  end

  # GET /review_periods/1/edit
  def edit
    @review_period = ReviewPeriod.find(params[:id])
  end

  # POST /review_periods
  # POST /review_periods.json
  def create
    @review_period = ReviewPeriod.new(params[:review_period])

    respond_to do |format|
      if @review_period.save
        format.html { redirect_to admin_review_period_path(@review_period), notice: 'Review period was successfully created.' }
        format.json { render json: @review_period, status: :created, location: @review_period }
      else
        format.html { render action: "new" }
        format.json { render json: @review_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /review_periods/1
  # PUT /review_periods/1.json
  def update
    @review_period = ReviewPeriod.find(params[:id])

    respond_to do |format|
      if @review_period.update_attributes(params[:review_period])
        format.html { redirect_to admin_review_period_path(@review_period), notice: 'Review period was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_periods/1
  # DELETE /review_periods/1.json
  def destroy
    @review_period = ReviewPeriod.find(params[:id])
    @review_period.destroy

    respond_to do |format|
      format.html { redirect_to admin_review_periods_url }
      format.json { head :no_content }
    end
  end
end
