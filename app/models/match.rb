class Match < ActiveRecord::Base
  has_many :matches_users
  has_many :users, :through => :matches_users
  
  has_many :rounds
  
  has_many :match_teams
  has_many :teams, :through => :match_teams
  
  belongs_to :winning_user, :class_name => 'User'
  belongs_to :winning_team, :class_name => 'Team'
  
  def done?
    rounds.count == number_of_rounds
  end
end
