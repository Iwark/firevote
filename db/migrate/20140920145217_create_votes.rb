class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :team_id, null: false

      t.timestamps

      t.index :user_id
      t.index :team_id
    end
  end
end
