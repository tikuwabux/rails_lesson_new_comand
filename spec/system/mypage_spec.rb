# 以下はイメージのテストコードなので実際には使えない

RSpec.describe "マイページ", type: :system do
  
  describe "進歩表示" do
    
    let!(:account) { create(:account) }
    
    it "ログイン中アカウントの情報｡及び進歩概要が表示されていること" do
      # 事前の準備としログイン操作を実行
      
      #ログイン画面へアクセス
      visit login_path
      
      # ログイン情報を入力
      fill_in "email", with: account.email
      fill_in "password", with: account.password
      
      #  ログインボタンをクリック
      click_on "ログイン"
      
      #マイページに遷移していることを確認
      expect(current_path).to eq mypage_path
      
      # テスト対象であるマイページの進歩表示部分の検証
      # withinで操作範囲を指定する
      #HTML上でclassに"Progress"が指定さてた要素の内側を指定
      within ".Progress" do
        
        #アカウント名が表示されていること
        expect(page).to have_content account.name
        
        #進歩率が表示されていること
        expect(page).to have_content "0%"
      end
      
      
    end
  
  end
end