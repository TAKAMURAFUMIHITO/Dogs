class Public::PostsController < ApplicationController
  before_action :authenticate_member!
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.member_id = current_member.id
    if post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to posts_path
    else
      @post = Post.new
      flash[:danger] = "投稿に失敗しました。入力内容を確認してから再度お試しください。"
      render "new"
    end
  end

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
    @today = Date.today  # 今日の日付を取得
    @now = Time.now      # 現在時刻を取得
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.member == current_member
      render :edit
    else
      redirect_to member_path(current_member)
    end
  end

  def update
    @post = Post.find(params[:id])
    # 添付画像を個別に削除
    if params[:post][:post_image_ids]
      params[:post][:post_image_ids].each do |post_image_id|
        post_image = @post.post_images.find(post_image_id)
        post_image.purge
      end
    end
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "投稿を編集しました。" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end

  def likes
    @post = Post.find(params[:id])
    likes = Like.where(post_id: @post.id).pluck(:member_id)
    @like_members = Member.find(likes)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, post_images: [])
  end
end
