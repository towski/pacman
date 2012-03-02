class RoundsController < ApplicationController
  def new
    @round = Round.new
    @match = Match.find params[:match_id]
    @round.match = @match
  end
  
  def create
    @match = Match.find params[:match_id]
    @round = Round.create params[:round].merge(:match => @match)
    if @round.match.done?
      redirect_to '/'
    else    
      redirect_to new_match_round_path(:match_id => @match.id)
    end
  end
end
