class AccountManagementsController < ApplicationController
  # 本番環境の時は以下を無視できるように考える
  skip_before_action :verify_authenticity_token, only: [:create]

  include ApplicationHelper

  def index
    @accounts = Account.all.order(created_at: :desc)
  end

end
