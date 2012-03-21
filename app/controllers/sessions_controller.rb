class SessionsController < ApplicationController
  require 'digest/sha1'
  before_filter :user_signed_in?, :only => [:delete]

  def new
    redirect_to accounts_path if current_user
  end

  def create
    if user = User.find_by_email_address(params[:email_address]).try(:authenticate, params[:password])
      user.previous_last_login, user.last_login = user.last_login, Time.now
      user.save
      create_remember_me_cookies user
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      if !params[:api]
        redirect_to accounts_path
      else
        render :xml => {:success => 1, :message => "Logged in successfully."}.to_json
      end
    else
      if !params[:api]
        flash[:error] = "Bad user/password combo"
        render :new
      else
        render :xml => {:success => 0, :message => "Bad user pass combo"}.to_json
      end
    end
  end

  def delete
    session.delete(:user_id)
    flash[:notice] = "Logged out."
    redirect_to root_url
  end

  def create_remember_me_cookies user
    user_id = (user.id).to_s
    cookies[:remember_me_id] = { :value => user_id, :expires => 30.days.from_now }
    user_code = Digest::SHA1.hexdigest( user.email_address )[4,18]
    cookies[:remember_me_code] = { :value => user_code, :expires => 30.days.from_now }
  end
end
