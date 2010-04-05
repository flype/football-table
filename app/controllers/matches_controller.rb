class MatchesController < ApplicationController
  
  def index
    @matches = Match.all
  end
  
  def new
    @match = Match.new
  end
  
  def create
    @match = Match.create(params[:match])
    redirect_to play_match_path(@match)
  end
  
  def play
    @match = Match.find(params[:id])
  end
end
