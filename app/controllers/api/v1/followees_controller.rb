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
    @message = Message.create(
      user_id: current_user.id,
      body: params[:body]
    )
    ActionCable.server.broadcast 'activity_channel', {
      id: @message.id,
      name: @message.user.name,
      body: @message.body,
      created_at: @message.created_at
    }
    render 'show.json.jbuilder'
  end
end
