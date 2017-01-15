class Api::V1::PostsController < ApplicationController
  def index
    @posts = current_foodie.posts
    render 'index.json.jbuilder'
  end
end
