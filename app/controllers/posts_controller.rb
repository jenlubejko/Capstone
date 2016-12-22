class PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index.html.erb'
  end

  def new
    @posts = Post.new
    render 'new.html.erb'
  end

  def create
    post = Post.new(
      title: params[:title],
      text: params[:text],
      foodie_id: params[:foodie_id]
    )
    post.save
    render 'create.html.erb'
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
    if post.save
      flash[:success] = "Post updated!"
      redirect_to "/posts"
    else 
      render 'edit.html.erb'
    end
  end

  def destroy
    post_id = params[:id]
    post = Post.find_by(id: post_id)
    post.destroy
    flash[:success] = "Post destroyed!"
    redirect_to '/posts'
  end
end