class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @today = Date.today  # 今日の日付を取得
    @now = Time.now      # 現在時刻を取得
    if params[:old]
      @posts = Post.old.page(params[:page]).per(15)                          # 古い順
    elsif params[:week_likes]
      posts = Post.week_likes
      @posts =  Kaminari.paginate_array(posts).page(params[:page]).per(15)   # 過去1週間のいいね数順に表示される
    else
      @posts = Post.latest.page(params[:page]).per(15)                       # 新着順
    end
  end

  def show
    @today = Date.today #今日の日付を取得
    @now = Time.now     #現在時刻を取得
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end
