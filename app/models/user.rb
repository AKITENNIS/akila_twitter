class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post,dependent: :destroy
  has_many :follow, class_name: 'Follow', :foreign_key => 'follow_user_id',dependent: :destroy
  has_many :followed, class_name: 'Follow', :foreign_key => 'followed_user_id',dependent: :destroy
end
