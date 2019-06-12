class PostsController < ApplicationController
  before_action :authenticate_current_user
  protect_from_forgery :except => [:create]
  def show
    @post=Post.find_by(params[:id])
    render "show"
  end

  def new
    render "new"
  end

  def create
    Post.create!(content:params[:content],user_id:current_user.id)
    redirect_to controller: :posts, action: :index
  end

  def index
    @user = current_user
    @follow = @user.follow
    @followed = @user.followed
    @posts=Post.all.follow_post(current_user).order(created_at: "DESC")
    render "index"
  end

  def edit
    @post=Post.find(params[:id])
    render "edit"
  end

  def update
    Post.find_by(id:params[:id]).update!(content:params[:content])
    redirect_to controller: :posts, action: :index
  end

  def destroy
    Post.find_by(id:params[:id]).destroy!
    redirect_to controller: :posts, action: :index
  end

  def favorite
    Favorite.create!(user_id:params[:user_id],post_id:params[:id])
    redirect_back(fallback_location: root_path)
  end

  def remove_favorite
    Favorite.find_by(user_id:params[:user_id],post_id:params[:id]).destroy!
    redirect_back(fallback_location: root_path)
  end

  def favorite_user
    @post=Post.find(params[:id])
  end

  private

  def authenticate_current_user
    if current_user
      @user = current_user
    else
      redirect_to controller: :posts, action: :index
    end
  end
end
