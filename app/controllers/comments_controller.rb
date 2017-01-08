class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.foodie_id = current_foodie.id 
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
    end
  end
end