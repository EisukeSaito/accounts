#Rails.application.config.middleware.insert_before 0, Rack::Cors do
#  allow do
#    origins '*'  # 任意のオリジン（特定のオリジンのみ許可する場合はドメインを指定）
#
#    resource '/accounts/*',  # ここではAPIエンドポイントを指定
#      headers: :any,
#      methods: [:get, :post, :put, :patch, :delete],
#      expose: ['Authorization']  # 必要に応じてヘッダーを公開
#  end
#end
