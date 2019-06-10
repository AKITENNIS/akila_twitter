class CreateFollow < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :follow_user, foreign_key: { to_table: :users }, null: false
      t.references :followed_user, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
