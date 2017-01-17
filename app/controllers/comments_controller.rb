class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: @post.id).order("created_at DESC")
    @comment = Comment.new(comment_params)
    puts "COMMENT PARAMS"
    p comment_params
    
    if @comment.save
      redirect_to post_path(@post)
    else 
      p @comment.errors.full_messages
      render 'posts/show'
    end
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :foodie_id)
  end
end