class SessionsController < ApplicationController
  def new
  end

  def create
    session[:name] = params[:name] if params[:name]

    if !current_user.present?
      redirect_to sessions_new_path
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:name] = nil
  end 


end
