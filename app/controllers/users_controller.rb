class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    if current_user
      @user = User.find(params[:id])
      @requested_tasks = @user.taskrequests
      @todos = TaskrequestsStep.todos(current_user.id)
    else
      redirect_to log_in_url, :notice => "Gelieve aan te melden"
    end
  end
end
