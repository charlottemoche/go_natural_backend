class Api::CommentsController < ApplicationController
  
  before_action :authenticate_user

  def create
    @comment = Comment.new(
      body: params[:body],
      post_id: Post.find_by(id: post_id)
      user_id: current_user.id
    )
    if @comment.save
      render "show.json.jb"
    else
      render json: {error: @comment.errors.full_messages}, message: :unprocessable_entity
    end
  end

  def update
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.body = params[:body]
    if @comment.save
      render "show.json.jb"
    else
      render json: {error: @comment.errors.full_messages}, message: :unprocessable_entity
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id])
    comment.destroy
    render json: {message: "Comment deleted"}
  end

end
