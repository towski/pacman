class Match < ActiveRecord::Base
  has_many :matches_users, :dependent => :destroy
  has_many :users, :through => :matches_users
  
  has_many :rounds, :dependent => :destroy
  
  has_many :match_teams, :dependent => :destroy
  has_many :teams, :through => :match_teams
  
  belongs_to :winning_user, :class_name => 'User'
  belongs_to :winning_team, :class_name => 'Team'

  named_scope :completed, lambda {
    {:conditions => ["winning_user_id is not null OR winning_team_id is not null"]}
  }
  
  def done?
    rounds.count >= number_of_rounds
  end
end
