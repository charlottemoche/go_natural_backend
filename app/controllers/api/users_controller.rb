class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:show, :create]

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      bio: params[:bio],
      image_url: cloudinary_url,
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
    if params[:image_file].length > 1
      response = Cloudinary::Uploader.upload(
      params[:image_file], resource_type: :auto
      )
      cloudinary_url = response["secure_url"]
    end
    user = params[:id]
    @user = User.find_by(id: user)
    if @user == current_user
      @user.name = params[:name] || @user.name
      @user.email = params[:email] || @user.email
      @user.bio = params[:bio] || @user.bio
      @user.image_url = cloudinary_url || @user.image_url
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
      if @user.save
        render "show.json.jb"
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: "You are not authorized to update this user" }, status: :bad_request
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user == current_user
      user.destroy
      render json: { message: "Account successfully deleted" }
    else
      render json: { message: "You are not authorized to delete this account" }, status: :bad_request
    end
  end

end