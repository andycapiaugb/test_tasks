class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to tasks_url, :notice => "User added :)"
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end

  def show
    if current_user
      @user = User.find(params[:id])
      @requested_tasks = @user.taskrequests
      @todos = TaskrequestsStep.joins(:step, :taskrequest).order("id DESC").where("current = ? AND ((steps.self = ? AND taskrequests.user_id = ?) OR executer_id = ?)", true, true, current_user.id, current_user.id)
    else
      redirect_to log_in_url, :notice => "Gelieve aan te melden"
    end
  end
end
