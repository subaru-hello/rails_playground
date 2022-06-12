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
          if response.success?
            response.body
          else
            raise QiitaApiClient::HTTPError, response
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

        # stockしたコンテンツ取得
        def my_stocked_contents
          user_id = get_user_id('subaru-hello')['id']
          response = connection.get(
            "/api/v2/users/#{user_id}/stocks",
            page: 1,
            per_page: 20
          )
          if response.success?
            response = response.body
            response.map { |res|
              [res['title'], res['created_at'], res['url']]
            }

          else
            raise QiitaApiClient::HTTPError, response
          end
        end
      end
    end
  end
end
