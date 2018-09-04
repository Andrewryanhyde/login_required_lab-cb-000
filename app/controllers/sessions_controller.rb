class SessionsController < ApplicationController
  before_action :require_login

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

  pivate

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
