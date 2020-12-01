class AccountsController < ApplicationController
  include AccountsHelper
  before_action :redirect_if_not_logged_in, only: [:index]
  def index
    @customer = current_user
    @accounts = @customer.accounts
  end

  def show
  end

  
end
