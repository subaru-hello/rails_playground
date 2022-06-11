# frozen_string_literal: true

module Api
  class YoutubesController < ApplicationController
    def index
      response_json = YoutubeApiClient.find_videos('110mH')
      render json: response_json
    end
  end
end
