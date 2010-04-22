class MatchesController < ApplicationController
  
  def index
    @matches = Match.all :limit => 8, :order => "id DESC"
    @pichichi = Player.pichichi
    @zamora = Player.zamora
  end
  
  def new
    @match = Match.new
  end
  
  def show
    @match = Match.find(params[:id])
    render :action => 'play'
  end
  
  def create
    @match = Match.create(params[:match])
    redirect_to play_match_path(@match)
  end
  
  def play
    @match = Match.find(params[:id])
  end
end
