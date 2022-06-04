# frozen_string_literal: true

module Api
  module V2
    class QiitasApiCLient
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
            '/api/v2/items'
          )
          if response.success?
            response.body
          else
            raise QiitaApiClient::HTTPError, response
          end
        end
      end
    end
  end
end
