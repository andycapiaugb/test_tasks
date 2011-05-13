class AbsenceRequestsController < ApplicationController
  # GET /absence_requests
  # GET /absence_requests.xml
  def index
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @absence_requests = @step.absence_requests.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @absence_requests }
    end
  end

  # GET /absence_requests/1
  # GET /absence_requests/1.xml
  def show
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @absence_request = @step.absence_requests.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @absence_request }
    end
  end

  # GET /absence_requests/new
  # GET /absence_requests/new.xml
  def new
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @absence_request = @step.absence_requests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @absence_request }
    end
  end

  # GET /absence_requests/1/edit
  def edit
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @absence_request = @step.absence_requests.find(params[:id])
  end

  # POST /absence_requests
  # POST /absence_requests.xml
  def create
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @absence_request = @step.absence_requests.build(params[:absence_request])

    respond_to do |format|
      if @absence_request.save
        format.html { redirect_to taskrequest_process_step_url(@step.taskrequest), :notice => 'Aanvraag Afwezigheid was succesvol verstuurd.' }
        format.xml  { render :xml => @absence_request, :status => :created, :location => @absence_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @absence_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /absence_requests/1
  # PUT /absence_requests/1.xml
  def update
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @absence_request = @step.absence_requests.find(params[:id])

    respond_to do |format|
      if @absence_request.update_attributes(params[:absence_request])
        format.html { redirect_to(@absence_request, :notice => 'Absence request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @absence_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /absence_requests/1
  # DELETE /absence_requests/1.xml
  def destroy
    @absence_request = AbsenceRequest.find(params[:id])
    @absence_request.destroy

    respond_to do |format|
      format.html { redirect_to(absence_requests_url) }
      format.xml  { head :ok }
    end
  end
end
