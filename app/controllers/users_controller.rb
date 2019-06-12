class UsersController < ApplicationController
  before_action :set_user,except: [:index]



  def show
    @user=User.find(params[:id])
    @posts = Post.where(user_id:@user.id)
    render "show"
  end

  def index
    @user=current_user
    @users=User.all
  end

  def following
  end

  def followed
  end

  def do_follow
    Follow.create!(follow_user_id:current_user.id,followed_user_id:@user.id)
    redirect_to controller: :users, action: :show, id: @user.id

  end

  def remove_follow
    Follow.find_by(follow_user_id:current_user.id,followed_user_id:@user.id).destroy!
      redirect_to controller: :users, action: :show, id: @user.id

  end


  private

  def set_user
    @user=User.find(params[:id])
    @follow = @user.follow
    @followed = @user.followed
  end
end
