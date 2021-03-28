class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @account = current_user.accounts.find(params[:account_id])
    @envelope = @account.envelopes.find(params[:envelope_id])
    @envelope.transactions.create(transaction_params)
    redirect_to account_envelope_path(@account, @envelope)
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
