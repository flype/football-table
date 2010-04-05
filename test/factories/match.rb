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

Factory.define :match do |m|
  m.name              "endless match"
  m.white_attacker    {|player| player.association(:player) }
  m.white_goalkeeper  {|player| player.association(:player) }
  m.red_attacker      {|player| player.association(:player) }
  m.red_goalkeeper    {|player| player.association(:player) }      
  m.start_time        Time.now - 600
  m.end_time          Time.now + 600
end