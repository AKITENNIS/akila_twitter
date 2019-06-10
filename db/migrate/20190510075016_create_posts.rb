class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content , null: false , default: ""
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
