module ApplicationHelper

  def supported_protocol
    "http://"
  end

  def dynamic_account_create_url
    "#{supported_protocol}#{request.host_with_port}/accounts"
  end
end
