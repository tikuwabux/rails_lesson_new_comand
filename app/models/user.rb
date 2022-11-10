class User < ApplicationRecord
  has_many :posts
  
  # validates カラム名(シンボル), 検証のルール
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :age, numericality: true  # 数値のみ許可
  validates :introduction, length: { in: 10..30 } #10文字以上30文字以内
end
