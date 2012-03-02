class User < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_many :matches_users
  has_many :matches, :through => :matches_users
  
  def matches_won
    matches.all(:conditions => {:winning_user_id => self.id})
  end
  
  def matches_won_count
    matches.count(:conditions => {:winning_user_id => self.id})
  end
end
