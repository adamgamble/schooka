class TransactionsController < ApplicationController
  before_filter :load_new_transaction, :only => [:new, :create]

  private
  def load_new_transaction
    @envelope = Envelope.find(params[:envelope_id])
  end

  public
  def create
    params["transaction"]["amount"] = BigDecimal(params["transaction"]["amount"]) * -1 if params["debit?"] == "true"
    if @envelope.transactions.create(params["transaction"])
      redirect_to account_path(@envelope.account)
    else
      render :nothing => true, :status => 500
    end
  end
end
