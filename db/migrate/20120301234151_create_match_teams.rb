class CreateMatchTeams < ActiveRecord::Migration
  def self.up
    create_table :match_teams do |t|
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :match_teams
  end
end
