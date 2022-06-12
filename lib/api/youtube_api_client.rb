# frozen_string_literal: true

require 'google/apis/youtube_v3'
require 'active_support/all'

GOOGLE_API_KEY = Rails.application.credentials.dig(:youtube, :youtube_api_key) # 上記で作成したキー

module Api
  class YoutubeApiClient
    # Loginできているか確認するsession
    def initialize(session = GOOGLE_API_KEY)
      @session = session
    end

    #三つに分ける必要あり
    #アクセスする準備を整えるメソッド。インスタンスを作成したり、Faradayのリクエストをしたり。
    #リクエストを送るメソッド
    #レスポンスを加工するメソッド
    class << self
      def find_videos(keyword, after: 1.month.ago, before: Time.zone.now)
        # グーグルアカウントで実行できるインスタンスを作成
        service = Google::Apis::YoutubeV3::YouTubeService.new
        # グーグルにアクセスするためのAPIKEYを紐づける
        service.key = GOOGLE_API_KEY

        next_page_token = nil
        # 処理を開始する
        loop do
          opt = {
            q: keyword,
            type: 'video',
            max_results: 50,
            order: :date,
            page_token: next_page_token,
            published_after: after.iso8601,
            published_before: before.iso8601
          }
          # APIに対してoptで指定したパラメーターをリクエストする
          results = service.list_searches(:snippet, **opt)
          array = []
          # 帰ってきたアイテムの中身を取得
          results.items.each do |item|
            snippet = item.snippet
            array << "#{snippet.channel_id}""#{snippet.title}"" by #{snippet.channel_title} (#{snippet.published_at})"
          end
          # 次のページへいく
          next_page_token = results.next_page_token
          break if next_page_token.blank?

          array
        end
      end

      #エンドポイントへリクエストを送るメソッド（一日５万件まで）
      def fetch_videos
        service.list_serches(
          'snippet',
          for_mine: true,
          type: 'video',
          options: { authorization: auth_client }
        )
      end

      #ハッシュを加工する
      def extract_video_data(**arg)

      end

      def service
        @service ||= Google::Apis::YoutubeV3::YouTubeService.new
      end

      def auth_client
        @auth_client ||= Signet::OAuth2::Client.new(@session.credentials)
      end
  end
  end
end
