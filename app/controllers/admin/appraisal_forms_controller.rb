module Admin
class AppraisalFormsController < BaseController
  #before_filter :verify_admin
  
  layout 'admin'
  # GET /appraisal_forms
  # GET /appraisal_forms.json
  def index
    @appraisal_forms = AppraisalForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appraisal_forms }
    end
  end

  # GET /appraisal_forms/1
  # GET /appraisal_forms/1.json
  def show
    @appraisal_form = AppraisalForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appraisal_form }
    end
  end

  # GET /appraisal_forms/new
  # GET /appraisal_forms/new.json
  def new
    @appraisal_form = AppraisalForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appraisal_form }
    end
  end

  # GET /appraisal_forms/1/edit
  def edit
    @appraisal_form = AppraisalForm.find(params[:id])
  end

  # POST /appraisal_forms
  # POST /appraisal_forms.json
  def create
    @appraisal_form = AppraisalForm.new(params[:appraisal_form])

    respond_to do |format|
      if @appraisal_form.save
        format.html { redirect_to admin_appraisal_form_path(@appraisal_form), notice: 'Appraisal form was successfully created.' }
        format.json { render json: @appraisal_form, status: :created, location: @appraisal_form }
      else
        format.html { render action: "new" }
        format.json { render json: @appraisal_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appraisal_forms/1
  # PUT /appraisal_forms/1.json
  def update
    @appraisal_form = AppraisalForm.find(params[:id])

    respond_to do |format|
      if @appraisal_form.update_attributes(params[:appraisal_form])
        format.html { redirect_to admin_appraisal_form_path(@appraisal_form), notice: 'Appraisal form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appraisal_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisal_forms/1
  # DELETE /appraisal_forms/1.json
  def destroy
    @appraisal_form = AppraisalForm.find(params[:id])
    @appraisal_form.destroy

    respond_to do |format|
      format.html { redirect_to admin_appraisal_forms_url }
      format.json { head :no_content }
    end
  end
  
  def add_remove_sections
    @appraisal_form = AppraisalForm.find(params[:id])
    if ! @appraisal_form.appraisals.empty?
      flash[:error] = "You cannot modify this form because it has been used for appraisals."
      redirect_to admin_appraisal_form_path(@appraisal_form)
    else
      render action: :add_remove_sections
    end
  end
  
  def add_remove_feedback_topics
    @appraisal_form = AppraisalForm.find(params[:id])
  end
  
  def add_section_to
    @appraisal_form = AppraisalForm.find(params[:id])
    @section = Section.find(params[:section_id])
    @appraisal_form.sections << @section
  end
  
  def add_feedback_topic_to
    @appraisal_form = AppraisalForm.find(params[:id])
    feedback_topic = FeedbackTopic.find(params[:feedback_topic_id])
    @appraisal_form.feedback_topics << feedback_topic
  end
  
  def remove_section_from
    @appraisal_form = AppraisalForm.find(params[:id])
    @section = Section.find(params[:section_id])
    @appraisal_form.sections.delete(@section)
  end
  
  def remove_feedback_topic_from
    @appraisal_form = AppraisalForm.find(params[:id])
    feedback_topic = FeedbackTopic.find(params[:feedback_topic_id])
    @appraisal_form.feedback_topics.delete(feedback_topic)
  end
  
  def preview
    @appraisal_form = AppraisalForm.find(params[:id])
  end
  
  private
  
  def verify_admin
    redirect_to root_url unless current_user.person.sys_admin?
  end
  
end
end
