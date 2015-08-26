class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was added."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error adding the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
