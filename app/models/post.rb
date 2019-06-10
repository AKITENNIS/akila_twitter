class Post < ApplicationRecord
  belongs_to :user
  has_many :favorite,dependent: :destroy

  scope :follow_post, -> user{
     follow_users=Follow.where(follow_user:user.id).pluck(:followed_user_id)
     where("user_id IN (?) OR user_id = ?", follow_users, user.id)
   }
end
