class TaskrequestsController < ApplicationController
  def new
    @user = current_user
    @taskrequest = @user.taskrequests.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @step }
    end
  end

  def create
    @user = current_user
    @task = Task.find(params[:taskrequest][:task_id])
    @user.tasks << @task

    if @user.save
      @user.taskrequests.last.steps << @task.steps #need to make a method out of this and extract the "executer" and transform it from for example "_self" to "#{current_user.id}"
      redirect_to taskrequest_process_step_url(@user.taskrequests.last), :notice => 'Taak-aanvraag gestart.'
    end
  end

  def show
    @taskrequest = Taskrequest.find(params[:id])
    @taskrequest_steps = @taskrequest.taskrequests_steps.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taskrequest }
      format.pdf
    end
  end

  def process_step
    @taskrequest = Taskrequest.find(params[:taskrequest_id])

    next_step = @taskrequest.get_next_step(current_user)

    if next_step
      redirect_to new_polymorphic_url([next_step, next_step.step.name.intern])
    else
      redirect_to user_url(current_user), :notice => "Voor de voortgang van dit proces is geen input meer nodig. De taak wordt, indien nodig, doorgestuurd."
    end
  end
  
end
