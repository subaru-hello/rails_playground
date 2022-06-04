# frozen_string_literal: true

module Api
  module V2
    class QiitasController < ApplicationController
      def index
        response_json = QiitaApiClient.get_items
        render json: response_json.map { |item| item.slice('title') }
      end
    end
  end
end
