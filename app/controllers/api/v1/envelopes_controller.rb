class Api::V1::EnvelopesController < Api::V1::BaseController
  respond_to :xml, :json
  def index
    @envelopes = current_user.accounts.find(params[:account_id]).envelopes
    respond_with(@envelopes)
  end

  def show
    @envelope = current_user.accounts.find(params[:account_id]).envelopes.find(params[:id])
    respond_with(@envelope)
  end
end
