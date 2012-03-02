class CreateRoundsUsers < ActiveRecord::Migration
  def self.up
    create_table :rounds_users do |t|
      t.integer :user_id
      t.integer :round_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds_users
  end
end
