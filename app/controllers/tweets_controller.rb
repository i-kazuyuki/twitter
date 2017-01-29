class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
    # 値が初期化されない戻るボタン。
    # parametersを元にnewアクションを分岐させている。
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def new
    # 値が初期化されない戻るボタン。
    # parametersを元にnewアクションを分岐させている。
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
   @tweet = Tweet.new(tweets_params)
    # if文の作成
    if @tweet.save
      # 一覧画面へ遷移して"ツイートを投稿しました"とフィードバックメッセージを表示する
      redirect_to tweets_path, notice: "ツイートを投稿しました"
    else
      # 入力フォームを再描画する
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @tweet.update(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice:"ツイートを編集しました！"
    else
      render 'new'
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    # edit, update, destroyで共通コード
    # idをキーとして値を取得するメソッド
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
