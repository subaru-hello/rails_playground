# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'varidation' do
    it { should validate_presence_of(:title) }
  end
end
