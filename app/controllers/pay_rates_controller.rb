class PayRatesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /pay_rates
  # GET /pay_rates.json
  def index
    @pay_rates = PayRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pay_rates }
    end
  end

  # GET /pay_rates/1
  # GET /pay_rates/1.json
  def show
    @pay_rate = PayRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pay_rate }
    end
  end

  # GET /pay_rates/new
  # GET /pay_rates/new.json
  def new
    @pay_rate = PayRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pay_rate }
    end
  end

  # GET /pay_rates/1/edit
  def edit
    @pay_rate = PayRate.find(params[:id])
  end

  # POST /pay_rates
  # POST /pay_rates.json
  def create
    @pay_rate = PayRate.new(params[:pay_rate])

    respond_to do |format|
      if @pay_rate.save
        format.html { redirect_to @pay_rate, notice: 'Pay rate was successfully created.' }
        format.json { render json: @pay_rate, status: :created, location: @pay_rate }
      else
        format.html { render action: "new" }
        format.json { render json: @pay_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pay_rates/1
  # PUT /pay_rates/1.json
  def update
    @pay_rate = PayRate.find(params[:id])

    respond_to do |format|
      if @pay_rate.update_attributes(params[:pay_rate])
        format.html { redirect_to @pay_rate, notice: 'Pay rate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pay_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_rates/1
  # DELETE /pay_rates/1.json
  def destroy
    @pay_rate = PayRate.find(params[:id])
    @pay_rate.destroy

    respond_to do |format|
      format.html { redirect_to pay_rates_url }
      format.json { head :no_content }
    end
  end
  
  def approve
    session[:original_uri] = request.referer
    @pay_rate = PayRate.find(params[:id])
    @pay_rate.approve!(current_user)
    redirect_to session[:original_uri]
  end
end
