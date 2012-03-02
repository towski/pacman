class MatchesController < ApplicationController
  def new
    @match = Match.new
    @users = User.all
  end
  
  def create
    match = Match.create params[:match]
    if match.team?
      first_team = Team.find_by_users params[:users][0..1]
      if first_team.nil?
        first_team = Team.create!
        first_team.users << User.find_by_name(params[:users][0])
        first_team.users << User.find_by_name(params[:users][1])
      end
      second_team = Team.find_by_users params[:users][2..3]
      if second_team.nil?
        second_team = Team.create!
        second_team.users << User.find_by_name(params[:users][2])
        second_team.users << User.find_by_name(params[:users][3])
      end
      match.teams << first_team
      match.teams << second_team
    else
      params[:users].each_with_index do |user, index|
        MatchesUser.create(:user => User.find_by_name(user), :match => match)
      end
    end
    redirect_to new_match_round_path(:match_id => match.id)
  end
end
