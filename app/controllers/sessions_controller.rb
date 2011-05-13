class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to user_url(user.id), :notice => "Logged in :)"
    else
      flash.now.alert = "Ongeldige login/passwoord"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to tasks_url, :notice => "Logged out!"
  end

end
