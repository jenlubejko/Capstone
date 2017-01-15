class CommentsController < ApplicationController
  def create
    @comment = Comment.new(post_id: params[:post_id])
    @comment.foodie_id = current_foodie.id
    @comment.save

    if comment.save
      redirect_to '/posts/:id'
    else 
      render 'new.html.erb'
    end
  end

  def find_post
    @post = Post.find_by(post_id: params[:post_id])
  end

end