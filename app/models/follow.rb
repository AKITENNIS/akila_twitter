class Follow < ApplicationRecord
  belongs_to :follow_user, class_name: 'User', :foreign_key => 'follow_user_id'
  belongs_to :followed_user, class_name: 'User', :foreign_key => 'followed_user_id'
end
