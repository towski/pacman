class Round < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  belongs_to :match
  belongs_to :winning_user, :class_name => "User"
  belongs_to :winning_team, :class_name => "Team"
  
  after_create :check_if_done
  
  def check_if_done
    if match.done?
      results = {}
      if match.team?
        match.rounds.each do |round|
          results[round.winning_team] ||= 0
          results[round.winning_team] += 1
        end
        highest_score = 0
        highest_team = nil
        results.each do |team, score|
          if score > highest_score
            highest_score = score
            highest_team = team
          end
        end
        if highest_score != 2
          match.winning_team = highest_team
        end
      else
        match.rounds.each do |round|
          results[round.winning_user] ||= 0
          results[round.winning_user] += 1
        end
        highest_score = 0
        highest_user = nil
        results.each do |user, score|
          if score > highest_score
            highest_score = score
            highest_user = user
          end
        end
        match.winning_user = highest_user
      end
      match.save
    end
  end
  
  def winning_user_name
    winning_user ? winning_user.name : nil
  end
  
  def winning_user_name=(name)
    self.winning_user_id = User.find_by_name(name).id
  end
end
