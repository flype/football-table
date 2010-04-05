class PlayersController < ApplicationController
  
  def index
    @players = Player.all
  end
  
  def create
    Player.create(params[:player])
    redirect_to :back
  end
end
