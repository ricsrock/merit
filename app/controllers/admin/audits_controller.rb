module Admin 
  class AuditsController < BaseController
    def index
      @audits = Audit
    end
    
    def show
      @audit = Audit.find(params[:id])
    end
  end
end
