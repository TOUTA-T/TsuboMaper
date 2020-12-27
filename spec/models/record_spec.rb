require 'rails_helper'

RSpec.describe 'モデル機能テスト', type: :model do
  before do
    stub_const('VALID_PHONE_NUMBER_REGEX', \A0[5789]0[-]?\d{4}[-]?\d{4}\z)

    # 多分ファクトリーぼっと作る？
  end

  describe 'バリデーション(null:false)のテスト' do
    context 'Userモデルに関して' do
      it 'emailが空の場合バリデーションにひっかかる' do
      end
      it 'emailがすでにある場合バリデーションにひっかかる' do
      end
    end
    context 'Storeモデルに関して' do
      it '店舗のnameが空の場合、バリデーションにひっかかる' do
      end
      it '店舗のemailが空の場合バリデーションにひっかかる' do
      end
      it 'phone_numberのフォーマットが適切であること' do
        expect(store.tel).to match(VALID_PHONE_NUMBER_REGEX)
      end
    end
end
