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
Factory.define :goal do |g|
  g.match     {|match| match.association(:match) }
  g.player    {|player| player.association(:player) }
end