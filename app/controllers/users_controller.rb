class UsersController < ApplicationController
  def index
    #Userモデル(usersテーブル)のレコードをすべて取得し､変数に代入
    @users = User.all
  end
  
  # ここより下の各アクションを追加しましょう
  def new
    @user = User.new
  end
  
  def create 
    # 正直あんまりこの文意味わからん｡
    # ユーザー新規作成ページの入力フォームに入力した値を受けれるらしい｡
    @user = User.new(params.require(:user).permit(:name, :email, :age, :introduction))
    if @user.save
      # ハッシュ名flashを定義し､その:noticeキーに対応する､valueに"ユーザーを新規登録しました"という文字列を代入する
      flash[:notice] = "ユーザーを新規登録しました"
      # /usersのリクエストURL(シンボル表記で :users)をリダイレクト先のURLとする
      # このメソッドが実行されると､このメソッド以降のコードは実行されないので場所に注意
      redirect_to :users
    else
      # newアクションへかえらす
      render "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end 
  
end
