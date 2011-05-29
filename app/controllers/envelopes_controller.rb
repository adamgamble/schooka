class EnvelopesController < ApplicationController
  before_filter :load_envelope, :only => [:show]
  before_filter :load_last_five_transactions, :only => [:show]

  private
  def load_envelope
    @envelope = current_user.envelopes.find params[:id]
  end

  def load_last_five_transactions
    @transactions = @envelope.transactions.find(:all, :limit => 5)
  end

  public
  def show
  end
end
