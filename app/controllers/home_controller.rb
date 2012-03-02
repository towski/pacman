class HomeController < ApplicationController
  def index
    @matches = Matches.all(:limit => 10, :order => 'created_at desc')
    @users = User.all.sort_by(&:matches_won_count).reverse
    @teams = Team.all.sort_by(&:matches_won_count).reverse
  end
end
