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

        def get_user_id(user_id)
          response = connection.get(
            "/api/v2/users/#{user_id}"
          )
          raise QiitaApiClient::HTTPError, response unless response.success?

          response.body
        end

        def take_items_from_qiita
          response = connection.get(
            '/api/v2/items',
            page: 1,
            per_page: 20
          )
          raise QiitaApiClient::HTTPError, response unless response.success?

          response.body
        end

        # stockしたコンテンツ取得
        def my_stocked_contents
          user_id = get_user_id('subaru-hello')['id']
          response = connection.get(
            "/api/v2/users/#{user_id}/stocks",
            page: 1,
            per_page: 20
          )
          raise QiitaApiClient::HTTPError, response unless response.success?

          response.body

          response = response.body
          response.map do |res|
            [res['title'], res['created_at'], res['url']]
          end
        end
      end
    end
  end
end
