# 登録機能のテストコード（イメージなので実際は使えない）

Rspec.describe "カリキュラムページ", type: :system do
  describe "課題提出フォーム" do
    let!(:account) { create(:account) }
    let!(:task_page_slug) { css-14 }
    let!(:pr_url) { "https//example.com" }
    
    it "フォームよりURLを入力･提出後､提出課題が登録され､提出完了の表示に切り替わること" do
      
      # ログイン処理
      ...省略
      
      #課題ページへのアクセス
      visit curriculums_path(task_page_slug)
      
      within ".Curriculum .SubmitTaskForm" do
        fill_in "pr-url", with: pr_url
        
        click_on "ログイン"
        
        #提出課題がDBに登録されていること
        submitted_task = account.tasks.find_by(task_name: "css-1")
        expect(submitted_task.pr_url).to eq pr_url
        
        #提出済みの表示に切り替わること
        expect(page).to have_content "課題は提出済みです｡"
      end
    end
  end
end