require 'rails_helper'
RSpec.describe 'レコード機能についてのテスト', type: :system do
  describe '店舗ログイン・ログアウト機能' do
    before do
      store = FactoryBot.create(:store)
      visit store_session_path
      fill_in "store_email", with:'test1@test.com'
      fill_in "store_password", with:'password'
      click_on 'ログイン'
    end
    context '店舗ログイン' do
      it '店舗ログインできる' do
        expect(page).to have_content '店舗トップページ'
      end
      it '店舗ログアウト出来る' do
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe 'ユーザーログイン・ログアウト機能' do
    before do
      user = FactoryBot.create(:user)
      visit store_session_path
      click_on 'ユーザーログイン'
      fill_in "user_email", with:'test1@test.com'
      fill_in "user_password", with:'password'
      click_on 'ログイン'
    end
    context 'ユーザーログイン' do
      it "ユーザーログインできる" do
        expect(page).to have_content '店舗ログインページ'
        # 今後ルートを変更した際に変わる予定
      end
      it "ユーザーログアウト出来る" do
        click_on 'ユーザLogout'
        expect(page).to have_content '店舗ログインページ'
      end
    end
  end
  describe '新規カルテ作成機能' do
    before do
      store = FactoryBot.create(:store)
      user = FactoryBot.create(:user)
      visit store_session_path
      fill_in "store_email", with:'test1@test.com'
      fill_in "store_password", with:'password'
      click_on 'ログイン'
    end
    context '新規顧客の場合' do
      it 'ユーザーの登録がパスワード無しで行われる' do
        click_on '新規顧客', match: :first
        fill_in "user_email", with:"test2@test.com"
        click_on 'アカウント登録'
        expect(page).to have_content '新規カルテ作成画面'
      end
    end
    context '既存客作成機能の場合' do
      it 'display_idを入力して作成すると、アンケートに表示される' do
        fill_in "display_id", with:"12345"
        click_on '既存客カルテを作成'
        expect(page).to have_content '12345'
      end
      # it 'display_idを入れないとエラーメッセージが出る' を取り入れたい
    end
  end
  describe 'アンケート機能' do
    before do
      store = FactoryBot.create(:store)
      user = FactoryBot.create(:user)
      label = FactoryBot.create(:label)
      visit store_session_path
      fill_in "store_email", with:'test1@test.com'
      fill_in "store_password", with:'password'
      click_on 'ログイン'
      fill_in "display_id", with:"12345"
      click_on '既存客カルテを作成'
    end
    context 'アンケートページの機能' do
      it 'ラベルを選択すると、詳細画面で表示される' do
        check 'record_label_ids_1'
        fill_in "record_person_in_charge", with:"test"
        click_on '作成'
        click_on '施術画面へ移動する'
        click_on 'カルテを保存する', match: :first
        expect(page).to have_content '頭痛'
      end
      it 'ラベルは未選択でも作成できる' do
        fill_in "record_person_in_charge", with:"test"
        click_on '作成'
        expect(page).to have_content 'カルテが生成されました'
      end
      it "施術者名を入れないとエラーメッセージが出る" do
        click_on '作成'
        expect(page).to have_content '施術者名を入力して下さい'
      end
      it "施術者名を入れればMap作成画面へ飛べる" do
        fill_in "record_person_in_charge", with:"test"
        click_on '作成'
        expect(page).to have_content 'カルテが生成されました'
      end
    end
  end

  describe '施術中画面' do
    before do
      store = FactoryBot.create(:store)
      user = FactoryBot.create(:user)
      label = FactoryBot.create(:label)
      visit store_session_path
      fill_in "store_email", with:'test1@test.com'
      fill_in "store_password", with:'password'
      click_on 'ログイン'
      fill_in "display_id", with:"12345"
      click_on '既存客カルテを作成'
      check 'record_label_ids_1'
      fill_in "record_person_in_charge", with:"test"
      click_on '作成'
      click_on '施術画面へ移動する'
    end
    context '画面表示' do
      it "カルテ作成時に生成したdispley_idが表示される" do
        expect(page).to have_content '12345'
      end
      it "作成した痛みMAPの表示(本来はexpect_pictureを表示したい)" do
        expect(page).to have_selector("img[src='/assets/painmap-37f7c6b443338235e865ce2a6476f222f9f04b3fd758671b42345a823ab0c5cf.gif']")
      end
      # it "ImageMapにより、画像の一部分をクリックできる" do
      # 表示が難しいため一旦飛ばす
      # end
    end
  end

  describe '施術中画面・コメント・カルテ保存' do
    before do
      store = FactoryBot.create(:store)
      user = FactoryBot.create(:user)
      label = FactoryBot.create(:label)
      visit store_session_path
      fill_in "store_email", with:'test1@test.com'
      fill_in "store_password", with:'password'
      click_on 'ログイン'
      fill_in "display_id", with:"12345"
      click_on '既存客カルテを作成'
      check 'record_label_ids_1'
      fill_in "record_person_in_charge", with:"test"
      click_on '作成'
      click_on '施術画面へ移動する'
    end
    context 'コメント機能・カルテ保存' do
      it "コメントを入力し、登録できる" do
        fill_in "comment_content", with:"お試し"
        click_on '登録する', match: :first
        expect(page).to have_content 'お試し'
      end
      it "空欄では登録を押しても投稿されない" do
        fill_in "comment_content", with:""
        click_on '登録する', match: :first
        expect(page).to have_content '投稿できませんでした'
      end
      it "編集し、更新できる" do
        fill_in "comment_content", with:"お試し"
        click_on '登録する'
        click_on '編集'
        fill_in "comment_content_1", with:"更新する"
        click_on '更新する', match: :first
        expect(page).to have_content '更新する'
      end
      it "削除できる" do
        fill_in "comment_content", with:"お試し"
        click_on '登録する'
        click_on '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content '削除'
      end
      it "「カルテを保存」を押すと詳細ページ(カルテ表示ページ)へ行く" do
        click_on 'カルテを保存する', match: :first
        expect(page).to have_content 'カルテ表示ページ'
      end
    end
  end

  describe 'カルテ一覧機能' do
    # 本来ならばrecordsのファクトリーボットで作成したいが、一旦力技で作成
    before do
      store = FactoryBot.create(:store)
      user = FactoryBot.create(:user)
      label = FactoryBot.create(:label)
      visit store_session_path
      fill_in "store_email", with:'test1@test.com'
      fill_in "store_password", with:'password'
      click_on 'ログイン'
      fill_in "display_id", with:"12345"
      click_on '既存客カルテを作成'
      check 'record_label_ids_1'
      fill_in "record_person_in_charge", with:"test"
      click_on '作成'
      click_on '施術画面へ移動する'
      fill_in "comment_content", with:"お試し"
      click_on '登録する', match: :first
      click_on 'カルテを保存する', match: :first
    end
    context '店舗ログイン時' do
      before do
        click_on '店舗TOPへ', match: :first
        click_on 'カルテ一覧へ'
      end
      it "店で作ったカルテのみ表示される" do
        expect(page).to have_content '店舗名'
        # 本番は「店舗名以外はない」という条件にしたい
      end
      it "ユーザーがいいねを押しているかどうか分かる(いいねしていないときは未いいね)" do
        expect(page).to have_content '未いいね'
        # ここも条件を複雑にしたい
      end
      it "詳細の確認(カルテ表示ページ)ができる" do
        click_on "詳細確認", match: :first
        expect(page).to have_content 'カルテ表示ページ'
      end
    end
    context "ユーザーログイン時" do
      before do
        click_on 'Logout', match: :first
        click_on 'ユーザーログイン'
        fill_in "user_email", with:'test1@test.com'
        fill_in "user_password", with:'password'
        click_on 'ログイン'
        click_on '施術一覧'
      end
      it "ユーザーが行った施術のみ表示される" do
        expect(page).to have_content '12345'
      end
      it "いいねが登録できる" do
        click_on '♡'
        expect(page).to have_content '❤'
      end
      it "いいねが解除できる" do
        click_on '♡'
        click_on '❤'
        expect(page).to have_content '♡'
      end
    end
  end
end
