class AccountManagementsController < ApplicationController
  before_action :authenticate, only: [:index]

  include ApplicationHelper

  def index
    @accounts = Account.all.order(created_at: :desc)
  end

  def show
    @account = Account.find_by(line_user_id: params[:id])
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
