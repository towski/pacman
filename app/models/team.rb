class Team < ActiveRecord::Base
  has_many :team_users
  has_many :users, :through => :team_users

  
  def self.find_by_users user_names
    users = User.find_all_by_name user_names
    old_team_users = TeamUser.all(:conditions => {:user_id => users.map(&:id)})
    if !old_team_users.empty?
      old_team_users.first.team
    else
      nil
    end
  end
  
  has_many :match_teams
  has_many :matches, :through => :match_teams
  
  def matches_won
    matches.all(:conditions => {:winning_team_id => self.id})
  end
  
  def matches_won_count
    matches.count(:conditions => {:winning_team_id => self.id})
  end
  
  def name
    users.map(&:name).join(" ")
  end
end
