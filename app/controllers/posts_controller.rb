class PostsController < ApplicationController
  def index
    sort_attribute = params[:sort]
    if current_foodie
      @posts = current_foodie.posts
    else
      @posts = []
    end
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    post = Post.new(
      title: params[:title],
      text: params[:text],
      foodie_id: params[:foodie_id]
    )
    post.save
    redirect_to "/posts/#{post.id}"
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    render 'show.html.erb'
  end

  def edit
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    render 'edit.html.erb'
  end

  def update
    post_id = params[:id]
    post = Post.find_by(id: post_id)
    post.title = params[:title]
    post.text = params[:text]
    flash[:success] = "Post updated!"
    redirect_to "/posts/#{post.id}"
  end

  def destroy
    post_id = params[:id]
    post = Post.find_by(id: post_id)
    post.destroy
    flash[:success] = "Post destroyed!"
    redirect_to '/posts'
  end
end