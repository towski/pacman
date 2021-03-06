class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :winning_user_id
      t.integer :winning_team_id
      t.string :game_type
      t.integer :number_of_rounds
      t.boolean :team
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
