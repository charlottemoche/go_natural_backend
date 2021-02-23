class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:show, :create]

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end
  
  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      image_url: params[:image_url],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render json: { message: "Account successfully created" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    user = params[:id]
    @user = User.find_by(id: user)
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.bio = params[:bio] || @user.bio
    @user.image_url = params[:image_url] || @user.image_url
    if params[:password]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
    end
    if @user.save
      render json: { message: "Profile successfully updated" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: {message: "Account successfully deleted"}
  end

end