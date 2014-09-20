class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :team_id, null: false
      t.string :ip_address, null: false

      t.timestamps

      t.index :team_id
    end
  end
end
