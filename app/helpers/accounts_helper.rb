module AccountsHelper

  def account_display account
    "#{account.name} - (#{number_to_currency(account.cached_balance / 100)})"
  end
end
