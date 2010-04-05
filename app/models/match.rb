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
  
  def result
    "#{white_team_goals}-#{red_team_goals}"
  end

  private
  
  def white_team_goals
    goals.by_players(white_attacker, white_goalkeeper).count
  end

  def red_team_goals
    goals.by_players(red_attacker, red_goalkeeper).count
  end
end
