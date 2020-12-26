require 'rails_helper'

RSpec.describe 'モデル機能テスト', type: :model do
  before do
    user = FactoryBot.create(:user)
    FactoryBot.create(:, user: user)
  end
end
