# == Schema Information
# Schema version: 20100403105522
#
# Table name: players
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Player < ActiveRecord::Base
  is_gravtastic :email, :size => 50
  has_many :matchs
  has_many :goals
  
  def matchs_played
    Match.find(:all, :conditions => ["red_goalkeeper_id = ? or white_goalkeeper_id = ? or red_attacker_id = ? or white_attacker_id = ? ", id, id, id, id])
  end
  
  def matchs_goalkeper
    Match.find(:all, :conditions => ["red_goalkeeper_id = ? or white_goalkeeper_id = ?", id, id])
  end

  def matchs_attacker
    Match.find(:all, :conditions => ["red_attacker_id = ? or white_attacker_id = ?", id, id])
  end
  
  def goals_in_match(match)
    goals.where(:match_id => match).count
  end
  
  def self.pichichi
    Player.find(:all).sort_by(&:goals_by_match).reverse
  end
  
  def goals_inside
    if (matchs_goalkeper.size > matchs_attacker.size)    
      Match.find(:all, :conditions => ["red_goalkeeper_id = ?", id]).collect { |i| i.white_team_goals }.sum +
      Match.find(:all, :conditions => ["white_goalkeeper_id = ?", id]).collect { |i| i.red_team_goals }.sum   
    end  
  end  
  
  def num_goals
    goals.size
  end    
  
  def self.zamora    
    find(:all).reject { |i| i.goals_inside.blank? }.sort_by(&:goals_inside_by_match)    
  end
  
  def goals_inside_by_match
    if (goals_inside)
        "%.2f" % (goals_inside/matchs_goalkeper.size)
    end  
  end
  
  def goals_by_match  
      "%.2f" % (goals.size.to_f/(matchs_goalkeper.size + matchs_attacker.size))
  end
  
  def num_matchs_played
    matchs_goalkeper.size + matchs_attacker.size
  end  
  
  def num_matchs_wins
     Match.find(:all, :conditions => ["red_goalkeeper_id = ? or red_attacker_id = ?", id, id]).reject { |i| i.white_team_goals >= i.red_team_goals  }.count + 
     Match.find(:all, :conditions => ["white_goalkeeper_id = ? or white_attacker_id = ?", id, id]).reject { |i| i.red_team_goals >= i.white_team_goals  }.count
  end
  
  def num_matchs_losts
     Match.find(:all, :conditions => ["red_goalkeeper_id = ? or red_attacker_id = ?", id, id]).reject { |i| i.white_team_goals <= i.red_team_goals  }.count +
     Match.find(:all, :conditions => ["white_goalkeeper_id = ? or white_attacker_id = ?", id, id]).reject { |i| i.red_team_goals <= i.white_team_goals  }.count
  end  

  def num_matchs_equals
     Match.find(:all, :conditions => ["red_goalkeeper_id = ? or red_attacker_id = ?", id, id]).reject { |i| (i.white_team_goals != i.red_team_goals)  }.count +
     Match.find(:all, :conditions => ["white_goalkeeper_id = ? or white_attacker_id = ?", id, id]).reject { |i| i.red_team_goals != i.white_team_goals  }.count
  end
  
  def last_racha
      if matchs_played.collect { |mt| mt.player_wins(id) }.reverse.index(-1) != 0 
         "Last #{matchs_played.collect { |mt| mt.player_wins(id) }.reverse.index(-1)} wins"
      else
        "Not Wins for #{matchs_played.collect { |mt| mt.player_wins(id) }.reverse.index(1)} matchs" 
      end  
  end
  
end
