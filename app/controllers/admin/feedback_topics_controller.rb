module Admin
  class FeedbackTopicsController < BaseController
    # GET /feedback_topics
    # GET /feedback_topics.json
    def index
      @feedback_topics = FeedbackTopic.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @feedback_topics }
      end
    end

    # GET /feedback_topics/1
    # GET /feedback_topics/1.json
    def show
      @feedback_topic = FeedbackTopic.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @feedback_topic }
      end
    end

    # GET /feedback_topics/new
    # GET /feedback_topics/new.json
    def new
      @feedback_topic = FeedbackTopic.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @feedback_topic }
      end
    end

    # GET /feedback_topics/1/edit
    def edit
      @feedback_topic = FeedbackTopic.find(params[:id])
    end

    # POST /feedback_topics
    # POST /feedback_topics.json
    def create
      @feedback_topic = FeedbackTopic.new(params[:feedback_topic])

      respond_to do |format|
        if @feedback_topic.save
          format.html { redirect_to admin_feedback_topic_path(@feedback_topic), notice: 'Feedback topic was successfully created.' }
          format.json { render json: @feedback_topic, status: :created, location: @feedback_topic }
        else
          format.html { render action: "new" }
          format.json { render json: @feedback_topic.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /feedback_topics/1
    # PUT /feedback_topics/1.json
    def update
      @feedback_topic = FeedbackTopic.find(params[:id])

      respond_to do |format|
        if @feedback_topic.update_attributes(params[:feedback_topic])
          format.html { redirect_to admin_feedback_topic_path(@feedback_topic), notice: 'Feedback topic was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @feedback_topic.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /feedback_topics/1
    # DELETE /feedback_topics/1.json
    def destroy
      @feedback_topic = FeedbackTopic.find(params[:id])
      @feedback_topic.destroy

      respond_to do |format|
        format.html { redirect_to admin_feedback_topics_url }
        format.json { head :no_content }
      end
    end
  end
end
