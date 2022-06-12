# frozen_string_literal: true

module Api
  module V2
    class QiitasController < ApplicationController
      def index
        response_json = QiitaApiClient.my_stocked_contents
        render json: response_json
      end
    end
  end
end
