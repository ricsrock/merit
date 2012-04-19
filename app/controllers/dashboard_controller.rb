class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    
  end
  
  def access_denied
    respond_to do |format|
      format.js
      format.html
    end
  end
  
end
