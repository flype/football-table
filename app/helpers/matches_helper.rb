module MatchesHelper
  
  def player_selector
    Player.all.collect {|u| [u.name, u.id]}
  end
end
