class GoalsController < ApplicationController
  
  def show
    Goal.create(:player_id => params[:id], :match_id => params[:match_id])
    redirect_to play_match_path(params[:match_id])
  end
end
