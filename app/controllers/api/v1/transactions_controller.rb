class Api::V1::TransactionsController < Api::V1::BaseController
  respond_to :xml, :json
  def index
    @transactions = current_user.accounts.find(params[:account_id]).envelopes.find(params[:envelope_id]).transactions
    respond_with(@transactions)
  end
end
