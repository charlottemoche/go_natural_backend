class Api::PostsController < ApplicationController

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    render "show.json.jb"   
  end

  def create
    
  end

end
