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
    find(:all, :conditions => "id in (select player_id from goals group by player_id order by count(*) DESC limit 1)")
  end
  
  def self.zamora
    # sacar porteros
    # calcular y sumar goles en contra por partido
    porteros = Hash.new
    zamora_goals = 0
    zamora_player = nil
    Match.all.each do |match|
      porteros[match.white_goalkeeper.id] ||= 0
      porteros[match.red_goalkeeper.id] ||= 0
      
      porteros[match.white_goalkeeper.id] += match.red_team_goals
      porteros[match.red_goalkeeper.id]   += match.white_team_goals
      
      if porteros[match.white_goalkeeper.id] <= zamora_goals
        zamora_goals = porteros[match.white_goalkeeper.id]
        zamora_player = match.white_goalkeeper
      end
      
      if porteros[match.red_goalkeeper.id] <= zamora_goals
        zamora_goals = porteros[match.red_goalkeeper.id]
        zamora_player = match.red_goalkeeper
      end
    end
    return [zamora_player].compact
  end
end
