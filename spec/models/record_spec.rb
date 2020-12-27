require 'rails_helper'

RSpec.describe 'モデル機能テスト', type: :model do
  before do
    stub_const('VALID_PHONE_NUMBER_REGEX', /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/)
  end

  describe 'バリデーション(null:false)のテスト' do
    context 'Userモデルに関して' do
      it 'emailが空の場合バリデーションにひっかかる' do
        user = User.new(email: '', password: 'password')
        expect(user).not_to be_valid
      end
      it 'emailがすでにある場合バリデーションにひっかかる' do
        user = User.create(email: 'test@test.com', password: 'password')
        user2 = User.create(email: 'test@test.com', password: 'password')
        expect(user2).not_to be_valid
      end
      it 'emailがない場合はバリデーションに通る' do
        user = User.new(email: 'test@test.com', password: 'password')
        expect(user).to be_valid
      end
    end
    context 'Storeモデルに関して' do
      it '店舗の名前が空の場合、バリデーションにひっかかる' do
        store = Store.new(name: '', email: 'test@test.com', tel: '08011111111', representative_name: 'test', password: 'password')
        expect(store).not_to be_valid
      end
      it '店舗のemailが空の場合バリデーションにひっかかる' do
        store = Store.new(name: 'test', email: '', tel: '08011111111', representative_name: 'test', password: 'password')
        expect(store).not_to be_valid
      end
      it '店舗の代表者名が空の場合バリデーションにひっかかる' do
        store = Store.new(name: 'test', email: 'test@test.com', tel: '08011111111', representative_name: '', password: 'password')
        expect(store).not_to be_valid
      end
      it '電話番号のフォーマットが適切でないとバリデーションに引っかかる' do
        store = Store.new(tel: '010111',)
        expect(store.tel).not_to match(VALID_PHONE_NUMBER_REGEX)
      end
      it '電話番号ののフォーマットが適切であれば通る' do
        store = Store.new(tel: '08011111111',)
        expect(store.tel).to match(VALID_PHONE_NUMBER_REGEX)
      end
      it '名前,email,代表者名,電話番号,パスワードが適切な場合バリデーションが通る' do
        store = Store.new(name: 'test', email: 'test@test.com', tel: '08011111111', representative_name: 'test', password: 'password')
        expect(store).to be_valid
      end
    end
  end
end
