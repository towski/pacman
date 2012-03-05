class RoundsController < ApplicationController
  def new
    @round = Round.new
    @match = Match.find params[:match_id]
    @round.match = @match
  end
  
  def create
    @match = Match.find params[:match_id]
    if params[:winning_user_names]
      params[:winning_user_names].each do |winning_user_name|
        Round.create :match => @match, :winning_user_name => winning_user_name
      end
    elsif params[:winning_team_ids]
      params[:winning_team_ids].each do |winning_team_id|
        Round.create :match => @match, :winning_team_id => winning_team_id
      end
    else
      @round = Round.create params[:round].merge(:match => @match)
    end
    if @match.reload.done?
      redirect_to '/'
    else    
      redirect_to new_match_round_path(:match_id => @match.id)
    end
  end
  
  def new_batch
  end
end
