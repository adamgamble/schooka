class AccountsController < ApplicationController
  before_filter :load_accounts, :only => [:index]
  before_filter :load_account, :only => [:show]

  private
  def load_accounts
    @accounts = current_user.budget.accounts
  end

  def load_account
    @account = current_user.budget.accounts.find params[:id]
  end

  public
  def index
  end

  def show
  end
end
