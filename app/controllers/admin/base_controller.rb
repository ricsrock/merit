module Admin
  class BaseController < ApplicationController
    # common behavior goes here ...
    before_filter :authenticate_user!
    
    before_filter :verify_admin
    layout 'admin'
    private
    def verify_admin
      if current_user.person.sys_admin?
        true
      else
        redirect_to(root_url, alert: "Sorry, you do not have permission to access that page.")
      end
    end
  end
end