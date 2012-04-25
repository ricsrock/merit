class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
    @user = current_user
    render 'devise/registrations/edit'
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_path(current_user)
  end
  
end
