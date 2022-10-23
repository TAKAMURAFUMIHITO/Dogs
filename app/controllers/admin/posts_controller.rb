class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @today = Date.today #今日の日付を取得
    @now = Time.now     #現在時刻を取得
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    posts = Post.all.sort {|a,b|                      #過去１週間のいいね数順に表示される
      b.likes.where(created_at: from...to).size <=>
      a.likes.where(created_at: from...to).size
    }
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(15)  #ページネーション
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
