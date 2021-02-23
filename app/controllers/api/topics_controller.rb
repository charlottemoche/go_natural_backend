class Api::TopicsController < ApplicationController

  def index
    @topics = Topic.all
    render "index.json.jb"
  end

  def show
    topic_id = params[:id]
    @topic = Topic.find_by(id: topic_id)
    render "show.json.jb"
  end
  
end