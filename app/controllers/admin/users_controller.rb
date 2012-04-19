class Admin::UsersController < ApplicationController
  #load_and_authorize_resource
  layout 'admin'
  def index
    @users = User.all(:order => :last_name)
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully created. This user must be activated before he/she can log in.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        flash[:error] = "There were errors: #{@user.errors.full_messages.to_sentence}"
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to admin_users_url }
        format.json { head :no_content }
      end
  end
  
  def edit_password
    @user = User.find(params[:id])
  end
  
  def confirm
    @user = User.find(params[:id])
    @user.confirm!
    redirect_to admin_users_url
  end
end
