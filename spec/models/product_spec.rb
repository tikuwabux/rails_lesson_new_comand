require 'rails_helper'

# ① :対象のクラス及びRSpecの種類を定義
# 今回の場合､対象のクラス=>Productクラス､RSpecの種類=>モデルスペック
RSpec.describe Product, type: :model do
  
  # ②: テスト対象のメソッド名やリクエストパスを記載
  # 慣習的にクラスメソッドは.、インスタンスメソッドは#をメソッド名の前につける
  # ｢何を､どのような条件で実行し､どのような結果となるのか｣の｢何を｣の部分
  describe "#price_less_than_1000?" do
    
    # ③: テストの前提条件を記載する
    # ｢どのような条件で実行し｣の部分
    context "価格が1000未満の場合" do
      
      # ⑤:  FactoryBot gemのメソッド､create(:product, price: 999)を用いて DBに指定したデータを追加
      #      let! を使用して､product変数に､作製したデータを入れる
      let!(:product) { create(:product, price: 999) }
      
      # ④: 期待する実行結果を記載
      # ｢どのような結果となるのか｣の部分
      it "返り値はtrueであること" do
        
        # ⑥: テストの実行結果を検証
        # expect(〇〇).to〜 => 〇〇が~であること｡
        # 今回なら､product.price_less_than_1000? が true であること｡
        expect(product.price_less_than_1000?).to be_truthy
        
        
      end
      
    end 
    
  end
  
  
  # 追加
  describe ".ids_price_less_than_1000" do
    let!(:product) { create(:product, price: 999) }
    
    # テストデータの作成
    before { create_list(:product, 2, price: 1000) }
    
    it "価格が1000円未満の商品のIDのみ取得できること" do
      expect(Product.ids_price_less_than_1000).to match_array [product.id]
    end
  end 
  
end

