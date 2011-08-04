class Api::V1::BaseController < ApplicationController
  before_filter :check_authentication

  def check_authentication
    if user = User.find_by_email_address(params[:email_address]).try(:authenticate, params[:password])
      user.previous_last_login, user.last_login = user.last_login, Time.now
      user.save
      session[:user_id] = user.id
    else
      render :json => {:success => 0, :message => "Bad User/Password combo"}.to_json
      exit
    end
  end
end
