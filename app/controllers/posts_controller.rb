class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    sort_attribute = params[:sort]
    render 'index.html.erb'
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    if params[:image]
      response = Unirest.post("http://uploads.im/api?upload", parameters: {file: params[:image]}).body
      image_url = response["data"]["img_url"]
    else
      image_url = "http://www.freefoodphotos.com/imagelibrary/confectionery/candy_fruits.jpg"
    end
    @post = Post.new(
      foodie_id: current_foodie.id,
      text: params[:text],
      address: params[:address],
      image_url: image_url
    )
    if @post.save
      image = Image.new(
          url: image_url,
          post_id: @post.id
        )
      image.save
      params[:tag_ids].each do |tag_id|
        post_tag = PostTag.new(post_id: @post.id, tag_id: tag_id)
        post_tag.save
      end

      ActionCable.server.broadcast 'activity_channel', {
        id: @post.id,
        text: @post.text,
        foodie_id: current_foodie.id,
        address: @post.address,
        image: @post.image_url,
        foodie: current_foodie.name
      }

      redirect_to "/posts/#{@post.id}"
    else
      render 'new.html.erb'
    end
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    @comments = Comment.where(post_id: @post.id).order("created_at DESC")
    @comment = Comment.new
    @post_tag = PostTag.new
    render 'show.html.erb'
  end

  def edit
    if current_foodie
      post_id = params[:id]
      @post = Post.find_by(id: post_id)
      render 'edit.html.erb'
    else 
      redirect_to '/login'
    end
  end

  def update
    if current_foodie
      post_id = params[:id]
      post = Post.find_by(id: post_id)
      post.update(post_params)
      redirect_to "/posts/#{post.id}"
    else 
      redirect_to '/login'
    end
  end

  def destroy
    if current_foodie
      post_id = params[:id]
      post = Post.find_by(id: post_id)
      post.destroy
      flash[:success] = "Post destroyed!"
      redirect_to '/posts'
    else 
      redirect_to '/login'
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :foodie_id, :address, tag_ids: [])
  end
end