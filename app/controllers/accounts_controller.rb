class AccountsController < ApplicationController
  before_filter :load_accounts, :only => [:index]
  before_filter :load_account, :only => [:show]

  private
  def load_accounts
    @accounts = current_user.budget.accounts
    @transactions_since_last_login = current_user.budget.transactions.since(current_user.previous_last_login)
  end

  def load_account
    @account = current_user.budget.accounts.find params[:id]
  end

  public
  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end
end
