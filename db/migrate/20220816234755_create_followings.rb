class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.integer :follower_id, null: false, foreign_key: { to_table: :users }
      t.integer :followed_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :followings, [:follower_id, :followed_id], unique: true
  end
end
