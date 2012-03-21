class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?, :user_signed_out?
  before_filter :check_for_remember_me_cookie
  protect_from_forgery

  def check_for_remember_me_cookie
    return if current_user
    if cookies[:remember_me_id] and cookies[:remember_me_code]
      user = User.find(cookies[:remember_me_id]) rescue nil
      if user && cookies[:remember_me_code] == Digest::SHA1.hexdigest(user.email_address)[4,18] #They are authenticated by cookie
        session[:user_id] = user.id
      else #They might be trying to cheat
        cookies.delete :remember_me_id
        cookies.delete :remember_me_code
      end
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end

  def user_signed_in?
    !!current_user
  end

  def user_signed_out?
    !user_signed_in?
  end
end
