class Api::PostsController < ApplicationController

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    render "show.json.jb"
  end

  # def create
  #   @post = Post.new(
  #     title = params[:title],
  #     subtitle = params[:subtitle],
  #     body = params[:body],
  #     image_url = params[:image_url]
  #   )
  #   if @post.save
  #     render "show.json.jb"
  #   else
  #     render json: {error: @post.errors.full_messages}, message: :unprocessable_entity
  #   end
  # end

end