class Api::PostsController < ApplicationController

  before_action :authenticate_user, except: [:show]

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    render "show.json.jb"
  end

  def create
    @post = Post.new(
      title: params[:title],
      subtitle: params[:subtitle],
      body: params[:body],
      image_url: params[:image_url],
      topic_id: params[:topic_id],
      user_id: current_user.id
    )
    if @post.save
      render "show.json.jb"
    else
      render json: {error: @post.errors.full_messages}, message: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.subtitle = params[:subtitle] || @post.subtitle
    @post.body = params[:body] || @post.body
    @post.image_url = params[:image_url] || @post.image_url
    @post.topic_id = params[:topic_id] || @post.topic_id
    if @post.save
      render "show.json.jb"
    else
      render json: {error: @post.errors.full_message}, message: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find_by(id: params[:id])
    post.destroy
    render json: {message: "Post successfully deleted"}
  end

  def like
    @post = Post.find(params[:id])
    @user = current_user.id
    @post.likes.create(user_id: @user)
    @post.save
    render "show.json.jb"
  end
  
  def unlike
    like = current_user.likes.find_by(post_id: params[:id])
    like.destroy
    render "show.json.jb"
  end

end