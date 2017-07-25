class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :user1, foreign_key: { to_table: :users }
    end
  end
end
