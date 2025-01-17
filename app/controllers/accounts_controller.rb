class AccountsController < ApplicationController
  def index
    @accounts = [1, 2, 3, 4, 5]
  end
end
