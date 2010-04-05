# == Schema Information
# Schema version: 20100403105522
#
# Table name: goals
#
#  id         :integer         not null, primary key
#  match_id   :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  
  scope :by_player, lambda {|player| where(:player_id => player.id) }
  scope :by_players, lambda {|*players| where('player_id = ? OR player_id = ?', players[0].id, players[1].id) } 
end
