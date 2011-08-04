class Api::V1::AccountsController < Api::V1::BaseController
  respond_to :xml, :json
  def index
    @accounts = current_user.accounts
    respond_with(@accounts)
  end

  def show
    @account = current_user.accounts.find(params[:id])
    respond_with(@account)
  end
end
