class Public::CommentsController < ApplicationController
  before_action :authenticate_member!
  def create
    @today = Date.today  # 今日の日付を取得
    @now = Time.now      # 現在時刻を取得
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.member_id = current_member.id
    @comment_post = @comment.post
    if @comment.save
      #通知の作成
      @comment_post.create_notification_comment!(current_member, @comment.id)
    else
      flash[:comment] = "コメントできませんでした。"
      redirect_to request.referer
    end
  end

  def destroy
    @today = Date.today  # 今日の日付を取得
    @now = Time.now      # 現在時刻を取得
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
