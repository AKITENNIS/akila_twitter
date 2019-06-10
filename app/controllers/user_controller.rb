class UserController < ApplicationController
  before_action :set_user,except: [:index]

  def show
  end

  def index
    @users=User.all
  end

  def following
  end

  def followed
  end

  def do_follow
    Follow.create!(follow_user_id:current_user.id,followed_user_id:@user.id)
    render "show"
  end

  def remove_follow
    Follow.find_by(follow_user_id:current_user.id,followed_user_id:@user.id).destroy!
    render "show"
  end


  private
  def set_user
    @user=User.find(params[:id])
  end
end
