class StepsController < ApplicationController
  # GET /steps
  # GET /steps.xml
  def index
    @tasks = Task.find(params[:task_id])
    @steps = @tasks.steps.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @steps }
    end
  end

  # GET /steps/1
  # GET /steps/1.xml
  def show
    @task = Task.find(params[:task_id])
    @step = @task.steps.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @step }
    end
  end

  # GET /steps/new
  # GET /steps/new.xml
  def new
    @task = Task.find(params[:task_id])
    @step = @task.steps.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @step }
    end
  end

  # GET /steps/1/edit
  def edit
    @task = Task.find(params[:task_id])
    @step = @task.steps.find(params[:id])
  end

  # POST /steps
  # POST /steps.xml
  def create
    @task = Task.find(params[:task_id])
    @step = @task.steps.build(params[:step])

    respond_to do |format|
      if @task.save
        format.html { redirect_to(task_steps_url(@task), :notice => 'Step was successfully created.') }
        format.xml  { render :xml => @step, :status => :created, :location => @step }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /steps/1
  # PUT /steps/1.xml
  def update
    @task = Task.find(params[:task_id])
    @step = @task.steps.find(params[:id])

    respond_to do |format|
      if @step.update_attributes(params[:step])
        format.html { redirect_to(task_steps_url(@task), :notice => 'Step was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.xml
  def destroy
    @step = Step.find(params[:id])
    @step.destroy

    respond_to do |format|
      format.html { redirect_to(steps_url) }
      format.xml  { head :ok }
    end
  end
end
