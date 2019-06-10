class HomeController < ApplicationController
  def show
    @post=Post.find_by(params[:id])
    render "show"
  end

  def new
    render "new"
  end

  def create
    Post.create!(content:params[:content],user_id:current_user.id)
    redirect_to controller: :home, action: :index
  end

  def index
    @posts=Post.all
    render "index"
  end


  def edit
    @posts=Post.all
    @post=Post.find_by(id:params[:id])
    render "edit"
  end

  def update
    Post.find_by(id:params[:id]).update!(content:params[:content])
    redirect_to controller: :home, action: :index
  end

  def destroy
    Post.find_by(id:params[:id]).destroy!
    redirect_to controller: :home, action: :index
  end

  def favorite
    Favorite.create!(user_id:params[:user_id],post_id:params[:id])
    redirect_to controller: :home, action: :index
  end
end
