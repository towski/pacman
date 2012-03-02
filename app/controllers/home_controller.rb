class HomeController < ApplicationController
  def index
    @users = User.all.sort_by(&:matches_won_count).reverse
    @teams = Team.all.sort_by(&:matches_won_count).reverse
  end
end
