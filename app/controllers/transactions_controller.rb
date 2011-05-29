class TransactionsController < ApplicationController
  before_filter :load_new_transaction, :only => [:new, :create]

  private
  def load_new_transaction
    @envelope = Envelope.find(params[:envelope_id])
  end

  public
  def create
    if params["debit?"] == "true" && !@envelope.can_debit_for?(params["transaction"]["amount"])
      flash[:error] = "You can't create a debit transaction greater than the envelopes balance"
      redirect_to account_envelope_path(@envelope.account, @envelope) and return
    end
    params["transaction"]["amount"] = BigDecimal(params["transaction"]["amount"]) * -1 if params["debit?"] == "true"
    @transaction = @envelope.transactions.create(params["transaction"])
    if @transaction.valid?
      flash[:notice] = "Transaction created!"
    else
      flash[:error] = "There was an error creating the transaction"
    end
      redirect_to account_envelope_path(@envelope.account, @envelope)
  end
end
