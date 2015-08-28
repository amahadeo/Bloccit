class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @topic = @post.topic
    @comment.user = current_user
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was added."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error adding the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @topic = @post.topic
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
