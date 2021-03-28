class EnvelopesController < ApplicationController
  before_action :authenticate_user!

  def show
    @account = current_user.accounts.find(params[:account_id])
    @envelope = @account.envelopes.find(params[:id])
  end
end
