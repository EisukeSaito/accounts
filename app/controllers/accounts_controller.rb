class AccountsController < ApplicationController
  # 本番環境の時は以下を無視できるように考える
  skip_before_action :verify_authenticity_token, only: [:create, :add_line_info]

  include ApplicationHelper

  def index
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.find_or_initialize_by(line_user_id: account_params[:line_user_id])
    if @account.update(account_params)
      #render @account, notice: 'お問い合わせが送信されました。'
      # かっこ悪い、あとで何とかする
      redirect_to "#{supported_protocol}#{request.host_with_port}/accounts/#{@account.id}"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def redirect_line_account
  end

  def add_line_info
    record = Account.where(line_user_id: params[:user_id])
    if record.empty?
      Account.new(
        route: params[:id],
        line_user_id: params[:user_id],
        email: params[:email] || 'demo@testing.com',
        name: params[:display_name] || 'dummy',
      ).save
    end

    head :no_content
  end

  private

  def account_params
    params.require(:account).permit(
      :route,
      :line_user_id,
      :email,
      :phone,
      :name,
      :birthday,
      :contact_info
    )
  end
end
