class IrregularPerformanceApprovalsController < ApplicationController
  # GET /irregular_performance_approvals
  # GET /irregular_performance_approvals.xml
  def index
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_approvals = @step.irregular_performance_approvals.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @irregular_performance_approvals }
    end
  end

  # GET /irregular_performance_approvals/1
  # GET /irregular_performance_approvals/1.xml
  def show
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_approval = @step.irregular_performance_approvals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @irregular_performance_approval }
    end
  end

  # GET /irregular_performance_approvals/new
  # GET /irregular_performance_approvals/new.xml
  def new
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @previous_steps = @step.taskrequest.get_previous_steps(@step.id)
    @irregular_performance_approval = @step.irregular_performance_approvals.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @irregular_performance_approval }
    end
  end

  # GET /irregular_performance_approvals/1/edit
  def edit
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_approval = @step.irregular_performance_approvals.find(params[:id])
  end

  # POST /irregular_performance_approvals
  # POST /irregular_performance_approvals.xml
  def create
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_approval = @step.irregular_performance_approvals.build(params[:irregular_performance_approval])

    respond_to do |format|
      if @irregular_performance_approval.save
        format.html { redirect_to taskrequest_process_step_url(@step.taskrequest), :notice => 'Irregular performance request approval was successfully send.' }
        format.xml  { render :xml => @irregular_performance_approval, :status => :created, :location => @irregular_performance_approval }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @irregular_performance_approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /irregular_performance_approvals/1
  # PUT /irregular_performance_approvals/1.xml
  def update
    @step = TaskrequestsStep.find(params[:taskrequests_step_id])
    @irregular_performance_approval = IrregularPerformanceApproval.find(params[:id])

    respond_to do |format|
      if @irregular_performance_approval.update_attributes(params[:irregular_performance_approval])
        format.html { redirect_to(@irregular_performance_approval, :notice => 'Irregular performance approval was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @irregular_performance_approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /irregular_performance_approvals/1
  # DELETE /irregular_performance_approvals/1.xml
  def destroy
    @irregular_performance_approval = IrregularPerformanceApproval.find(params[:id])
    @irregular_performance_approval.destroy

    respond_to do |format|
      format.html { redirect_to(irregular_performance_approvals_url) }
      format.xml  { head :ok }
    end
  end
end
