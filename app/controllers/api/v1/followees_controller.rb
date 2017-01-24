class Api::V1::FolloweesController < ApplicationController
  def index
    @followees = current_foodie.followees
    @posts = []
    followees = current_foodie.followees.each do |followee|
      followee.posts.each do |post|
        @posts << post
      end
    end
    p @posts
    render 'index.json.jbuilder'
  end

  def create
    @post = post.create(
      current_foodie: current_foodie.id,
      text: params[:text]
    )
    render 'show.json.jbuilder'
  end
end