class ApplicationController < ActionController::Base
  protect_from_forgery
  #check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, :alert => exception.message }
      format.js   { render :template => 'dashboard/access_denied', :alert => exception.message }
    end
  end
 
  before_filter :set_the_user
 
   # One way of using declarative_authorization is to restrict access
   # to controller actions by default by stating the following line.
   # This installs a default before_filter for authorization according
   # to the action names.
   #filter_access_to :all

   protected
   # There are multiple ways of handling authorization failures.  
   # One is to implement a permission denied method as shown below.  
   # If none is defined, either a simple string is displayed
   # to the user ("You are not allowed...", default) or the authorization
   # exception is raised.  TODO state configuration option
   # 
# def permission_denied
#   respond_to do |format|
#     flash[:error] = "Sorry, you are not allowed to access the requested page. #{current_user.login} (#{current_user.role_symbols})."
#     format.html { redirect_to(:back) rescue redirect_to('/') }
#     format.xml  { head :unauthorized }
#     format.js   { head :unauthorized }
#   end
# end

   # set_current_user sets the global current user for this request.  This
   # is used by model security that does not have access to the
   # controller#current_user method.  It is called as a before_filter.
   def set_the_user
     User.the_user = current_user
   end

#def permission_denied
#  flash[:error] = "Sorry, you are not allowed to access that page. #{current_user.login} (#{current_user.role_symbols})."
#  redirect_to root_url
#end
end
