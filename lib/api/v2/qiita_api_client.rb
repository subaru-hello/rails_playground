# frozen_string_literal: true

module Api
  module V2
    class QiitaApiClient
      class HTTPError < StandardError
        def initialize(response)
          super "status=#{response.status} body=#{response.body}"
        end
      end

      class << self
        def connection
          Faraday::Connection.new('https://qiita.com') do |builder|
            builder.authorization :Bearer, Rails.application.credentials.dig(:qiita, :qiita_token).to_s
            builder.request :url_encoded # リクエストパラメータを URL エンコードする
            builder.response :logger
            builder.adapter Faraday.default_adapter
            builder.response :json, content_type: 'application/json' # レスポンスボディをJSONパースする
          end
        end

        def get_items
          response = connection.get(
            '/api/v2/items',
            page: 1,
            per_page: 20
          )
          if response.success?
            response.body
          else
            raise QiitaApiClient::HTTPError, response
          end
        end

        # LGTM数が200をこえる記事を取得（https://qiita.com/api/v2/docs#%E6%8A%95%E7%A8%BF）
      end
    end
  end
end
