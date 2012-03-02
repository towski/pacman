class CreateMatchesUsers < ActiveRecord::Migration
  def self.up
    create_table :matches_users do |t|
      t.integer :match_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :matches_users
  end
end
