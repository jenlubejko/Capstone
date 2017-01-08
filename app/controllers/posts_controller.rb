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
      text: params[:text]
    )
    if @post.save
      params[:tag_ids].each do |tag_id|
        post_tag = PostTag.new(post_id: @post.id, tag_id: tag_id)
        post_tag.save
      end
      flash[:success] = "Post created successfully!"
      redirect_to "/posts/#{@post.id}"
    else
      render 'new.html.erb'
    end
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    @comments = @post.comments.all
    @comment = @post.comments.build
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