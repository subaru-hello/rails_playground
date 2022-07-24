# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end
