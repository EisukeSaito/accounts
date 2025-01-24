class AccountsController < ApplicationController
  # 本番環境の時は以下を無視できるように考える
  skip_before_action :verify_authenticity_token, only: [:create]

  include ApplicationHelper

  def index
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      #render @account, notice: 'お問い合わせが送信されました。'
      # かっこ悪い、あとで何とかする
      redirect_to "#{supported_protocol}#{request.host_with_port}/accounts/#{@account.id}", notice: 'お問い合わせが送信されました。'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(
      :route,
      :email,
      :phone,
      :name,
      :birthday,
      :contact_info
    )
  end
end
