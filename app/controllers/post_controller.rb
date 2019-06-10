class PostController < ApplicationController
  before_action :authenticate_current_user

  def show
    @post=Post.find_by(params[:id])
    render "show"
  end

  def new
    render "new"
  end

  def create
    Post.create!(content:params[:content],user_id:current_user.id)
    redirect_to controller: :post, action: :index
  end

  def index
    @user = current_user

    @posts=Post.all.follow_post(current_user)
    render "index"
  end


  def edit
    @post=Post.find_by(id:params[:id])
    render "edit"
  end

  def update
    Post.find_by(id:params[:id]).update!(content:params[:content])
    redirect_to controller: :post, action: :index
  end

  def destroy
    Post.find_by(id:params[:id]).destroy!
    redirect_to controller: :post, action: :index
  end

  def favorite
    Favorite.create!(user_id:params[:user_id],post_id:params[:id])
    redirect_to controller: :post, action: :index
  end

  def remove_favorite
    Favorite.find_by(user_id:params[:user_id],post_id:params[:id]).destroy!
    redirect_to controller: :post, action: :index
  end

  def favorite_user
    @post=Post.find(params[:id])
  end

  private

  def authenticate_current_user
    if current_user
      @user = current_user
    else
      redirect_to controller: :post, action: :index
    end
  end
end
