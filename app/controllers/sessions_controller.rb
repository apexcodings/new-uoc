class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"

      if user.clinical_trials?
        redirect_to clinical_trials_dashboard_path
      else
        redirect_to(session[:intended_url] || dashboard_path)
      end

      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're now logged out!"
  end

end

