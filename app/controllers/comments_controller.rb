class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end
end