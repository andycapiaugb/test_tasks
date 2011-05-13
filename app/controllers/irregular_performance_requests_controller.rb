class IrregularPerformanceRequestsController < ApplicationController
  # GET /irregular_performance_requests
  # GET /irregular_performance_requests.xml
  def index
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_requests = @step.irregular_performance_requests.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @irregular_performance_requests }
    end
  end

  # GET /irregular_performance_requests/1
  # GET /irregular_performance_requests/1.xml
  def show
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_request = @step.irregular_performance_requests.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @irregular_performance_request }
    end
  end

  # GET /irregular_performance_requests/new
  # GET /irregular_performance_requests/new.xml
  def new
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_request = @step.irregular_performance_requests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @irregular_performance_request }
    end
  end

  # GET /irregular_performance_requests/1/edit
  def edit
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_request = @step.irregular_performance_requests.find(params[:id])
  end

  # POST /irregular_performance_requests
  # POST /irregular_performance_requests.xml
  def create
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_request = @step.irregular_performance_requests.build(params[:irregular_performance_request])

    respond_to do |format|
      if @irregular_performance_request.save
        format.html { redirect_to taskrequest_process_step_url(@step.taskrequest), :notice => 'Irregular performance request was successfully send.' }
        format.xml  { render :xml => @irregular_performance_request, :status => :created, :location => @irregular_performance_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @irregular_performance_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /irregular_performance_requests/1
  # PUT /irregular_performance_requests/1.xml
  def update
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_request = @step.irregular_performance_requests.find(params[:id])

    respond_to do |format|
      if @irregular_performance_request.update_attributes(params[:irregular_performance_request])
        format.html { redirect_to user_url(current_user), :notice => 'Irregular performance request was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @irregular_performance_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /irregular_performance_requests/1
  # DELETE /irregular_performance_requests/1.xml
  def destroy
    @irregular_performance_request = IrregularPerformanceRequest.find(params[:id])
    @irregular_performance_request.destroy

    respond_to do |format|
      format.html { redirect_to(irregular_performance_requests_url) }
      format.xml  { head :ok }
    end
  end
end
