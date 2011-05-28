class BudgetsController < ApplicationController
  before_filter :load_budgets, :only => [:index]
  private
  def load_budgets
    @budgets = current_user.budget
  end
  public
  def index
  end
end
