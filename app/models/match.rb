# == Schema Information
# Schema version: 20100403105522
#
# Table name: matches
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  white_goalkeeper_id :integer
#  white_attacker_id   :integer
#  red_goalkeeper_id   :integer
#  red_attacker_id     :integer
#  start_time          :datetime
#  end_time            :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

class Match < ActiveRecord::Base
  belongs_to :white_attacker,   :class_name => "Player"
  belongs_to :white_goalkeeper, :class_name => "Player"
  belongs_to :red_attacker,     :class_name => "Player"
  belongs_to :red_goalkeeper,   :class_name => "Player"
  has_many   :goals
  
  before_create :set_start_time
  
  def result
    "#{white_team_goals}-#{red_team_goals}"
  end
  
  def finnish?
    goals.count == 10
  end
  
  def white_team_goals
    goals.by_players(white_attacker, white_goalkeeper).count
  end

  def red_team_goals
    goals.by_players(red_attacker, red_goalkeeper).count
  end
  
  def red_goals_received
    white_team_goals
  end
  
  def white_goals_received
    red_team_goals
  end
  
  private
  def set_start_time
    start_time = Time.now
  end
end
