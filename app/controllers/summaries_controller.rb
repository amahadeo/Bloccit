class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end
  
  def create
    @summary = Summary.new(params.require(:summary).permit(:body))
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary.post = @post
    if @summary.save
      flash[:notice] = "Summary saved."
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "Error saving summary, please try again."
      render :new
    end
  end
end
