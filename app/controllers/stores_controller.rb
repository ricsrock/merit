class StoresController < ApplicationController
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  #filter_access_to :all
  
  def index
    @stores = current_user.accessible_stores
  end
  
  def show
    @store = Store.find(params[:id])
  end
  
end
