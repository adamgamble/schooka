class SessionsController < ApplicationController
  before_filter :user_signed_in?, :only => [:delete]

  def new
  end

  def create
    if user = User.find_by_email_address(params[:email_address]).try(:authenticate, params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to accounts_path
    else
      flash[:error] = "Bad user/password combo"
      render :new
    end
  end

  def delete
    session.delete(:user_id)
    flash[:notice] = "Logged out."
    redirect_to root_url
  end
end
