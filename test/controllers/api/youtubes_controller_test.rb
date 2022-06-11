# frozen_string_literal: true

require 'test_helper'

module Api
  class YoutubesControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get api_youtubes_index_url
      assert_response :success
    end
  end
end
