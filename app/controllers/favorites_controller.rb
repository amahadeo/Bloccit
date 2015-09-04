class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    if favorite.save
      flash[:notice] = "You're now following this post."
      redirect_to [post.topic, post]
    else
      redirect_to [post.topic, post], error: "There was an error following post."
    end
  end
  
  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])
    authorize favorite
    if favorite.destroy
      redirect_to [post.topic, post], notice: "You have unfollowed this post."
    else
      redirect_to [post.topic, post], error: "There was an error unfollowing this post."
    end
  end
  
end
