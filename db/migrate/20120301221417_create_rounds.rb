class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :winning_user_id
      t.integer :winning_team_id
      t.integer :match_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
