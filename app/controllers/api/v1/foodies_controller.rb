class Api::V1::FoodiesController < ApplicationController
  def index
    @foodies = Foodie.all
    render 'index.json.jbuilder'
  end
end